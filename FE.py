import mysql.connector as msc

conn = msc.connect(
    host="localhost",
    user="root",
    password="0mm...123",
    database="quizdb"
)
print("--------------")
print("  USER LOGIN")
print("--------------")

def login():
    username = input("Enter username: ")
    password = input("Enter password: ")
    
    cursor = conn.cursor()
    cursor.execute("SELECT user_id FROM user WHERE username=%s AND password=%s", (username, password))
    user = cursor.fetchone()
    
    if user:
        print("Login successful")
        return username
    else:
        print("Login failed")
        return None
    cursor.close()

def take_quiz(username):
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM question ORDER BY RAND() LIMIT 5")
    questions = cursor.fetchall()
    
    if not questions:
        print("No questions found in the database.")
        return

    correct = 0
    question_count = 0

    for question in questions:
        question_count = question_count + 1

        print("\nQuestion " + repr(question_count) + ":")
        print("Q: " + question["question"])
        print("A. " + question["option_a"])
        print("B. " + question["option_b"])
        print("C. " + question["option_c"])
        print("D. " + question["option_d"])

        ans = input("Enter your answer (A/B/C/D): ")
        correct_ans = question["correction_option"]

        if ans == correct_ans:
            correct = correct + 1

    score = int((correct / question_count) * 100) if question_count > 0 else 0

    cursor.execute("INSERT INTO scores (username, score) VALUES (%s, %s)", (username, score))
    conn.commit()
    print("----------------------")
    print("  Test Completed!")
    print("----------------------")

    cursor.close()

username = login()
if username:
    take_quiz(username)

conn.close()