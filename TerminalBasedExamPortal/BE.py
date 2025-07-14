import mysql.connector as msc
from openpyxl import Workbook

conn = msc.connect(
    host="localhost",
    user="Your_Username",
    password="Your_Password",
    database="quizdb"
)

print("----------------")
print(" FACULTY LOGIN")
print("----------------")

def fac_login():
    fac_name = input("Enter name: ")
    password = input("Enter password: ")
    
    cursor = conn.cursor()
    cursor.execute("SELECT fac_id FROM faculty WHERE fac_name=%s AND password=%s", (fac_name, password))
    user = cursor.fetchone()
    
    if user:
        print("Login successful")
        return user[0]
    else:
        print("Login failed")
        return None
    cursor.close()
    

def fetch_result():
    cursor = conn.cursor(dictionary=True)
    cursor.execute("SELECT * FROM scores ORDER BY score DESC LIMIT 10")
    results = cursor.fetchall()
    
    if not results:
        print("No results found.")
        return
    print("\nTop 10 Scores:")
    for result in results:
        print("Name :", result['username'], "Score:", result['score']) 

    export = input("Do you want to export the results? (yes/no): ")
    if export.lower() == 'yes':
                wb = Workbook()
                ws = wb.active
                ws.append(["Username", "Score"])  # Headers
                
                for result in results:
                    ws.append([result['username'], result['score']])
                
                wb.save("quiz_results.xlsx")
                print("Results saved to quiz_results.xlsx")
    cursor.close()
    

if fac_login():
    fetch_result()



