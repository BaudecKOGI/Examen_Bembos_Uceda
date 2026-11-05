import Foundation

struct ItemModel: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let subtitle: String
    let description: String
    let category: String
    let price: Double
    let calories: Int
    let imageName: String   // nombre del SF Symbol
}
