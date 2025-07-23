import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalLabel: UILabel!

    let store = ExpenseStore()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    @IBAction func addExpense(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty,
              let amountText = amountTextField.text, let amount = Double(amountText) else {
            return
        }

        store.addExpense(name: name, amount: amount)
        tableView.reloadData()
        totalLabel.text = "Total: ₹\(store.total())"
        nameTextField.text = ""
        amountTextField.text = ""
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.expenses.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpenseCell", for: indexPath)
        let expense = store.expenses[indexPath.row]
        cell.textLabel?.text = "\(expense.name) - ₹\(expense.amount)"
        return cell
    }
}
