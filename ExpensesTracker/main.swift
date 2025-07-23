
import Foundation

class Expense {
    var name: String
    var amount: Double

    init(name: String, amount: Double) {
        self.name = name
        self.amount = amount
    }
}

class ExpenseStore {
    var expenses: [Expense] = []

    func addExpense(name: String, amount: Double) {
        let newExpense = Expense(name: name, amount: amount)
        expenses.append(newExpense)
    }
    
    func total() -> Double {
        return expenses.reduce(0) { $0 + $1.amount }
    }
    
    func listExpenses() {
        if expenses.isEmpty {
            print("No expenses recorded.")
            return
        }
        
        print("\nExpenses:")
        for (index, expense) in expenses.enumerated() {
            print("\(index + 1). \(expense.name) - ₹\(expense.amount)")
        }
        print("Total: ₹\(total())")
    }
}

// Simple console-based expense tracker
let store = ExpenseStore()

print("Simple Expense Tracker")
print("Commands: add, list, quit")

while true {
    print("\nEnter command: ", terminator: "")
    
    guard let input = readLine()?.lowercased() else {
        continue
    }
    
    switch input {
    case "add":
        print("Enter expense name: ", terminator: "")
        guard let name = readLine(), !name.isEmpty else {
            print("Invalid name")
            continue
        }
        
        print("Enter amount: ", terminator: "")
        guard let amountString = readLine(), let amount = Double(amountString) else {
            print("Invalid amount")
            continue
        }
        
        store.addExpense(name: name, amount: amount)
        print("Expense added successfully!")
        
    case "list":
        store.listExpenses()
        
    case "quit":
        print("Goodbye!")
        exit(0)
        
    default:
        print("Unknown command. Use: add, list, quit")
    }
}
