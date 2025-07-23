import Foundation

class ExpenseStore {
  var expenses: [Expense] = []

  func addExpense(name:String,amount:Double){
       let newExpense = Expense(name: name, amount: amount)
       expenses.append(newExpense)
  }    
  
  func total()-> Double {
     return expenses.reduce(0) { $0 + $1.amount }
  }
}