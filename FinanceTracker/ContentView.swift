import SwiftUI
import Charts

struct ContentView: View {
    @State private var expenses: [Expense] = []
    @State private var showAddExpense: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                List(expenses) { expense in
                    HStack {
                        Text(expense.category)
                        Spacer()
                        Text("$\(expense.amount, specifier: "%.2f")")
                    }
                }
                .navigationTitle("Expenses")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showAddExpense = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showAddExpense) {
                    AddExpenseView(expenses: $expenses)
                }

                ExpenseChart(expenses: expenses)
                    .frame(height: 200)
            }
        }
    }
}

struct ExpenseChart: View {
    var expenses: [Expense]
    
    var body: some View {
        let groupedExpenses: [String: Double] = Dictionary(grouping: expenses) { $0.category }
            .mapValues { $0.reduce(0) { $0 + $1.amount } }
        
        return Chart {
            ForEach(groupedExpenses.keys.sorted(), id: \.self) { key in
                BarMark(
                    x: .value("Category", key),
                    y: .value("Amount", groupedExpenses[key] ?? 0)
                )
            }
        }
    }
}
