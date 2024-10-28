import Foundation

struct Expense: Identifiable {
    let id = UUID()
    var category: String
    var amount: Double
    var date: Date
}

