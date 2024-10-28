import SwiftUI

struct AddExpenseView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var expenses: [Expense]
    
    @State private var category: String = ""
    @State private var amount: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Category")) {
                    TextField("Enter category", text: $category)
                }
                
                Section(header: Text("Amount")) {
                    TextField("Enter amount", text: $amount)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Date")) {
                    DatePicker("Select date", selection: $date, displayedComponents: .date)
                }
                
                Button("Save") {
                    if let amount = Double(amount) {
                        let newExpense = Expense(category: category, amount: amount, date: date)
                        expenses.append(newExpense)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
            .navigationTitle("Add Expense")
        }
    }
}
