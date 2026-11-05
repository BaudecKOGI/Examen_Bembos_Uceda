import Foundation

struct UserModel: Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let password: String
}
