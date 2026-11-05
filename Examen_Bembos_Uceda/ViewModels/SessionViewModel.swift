import SwiftUI
import Combine

@MainActor
final class SessionViewModel: ObservableObject {

    // Lista de usuarios registrados en memoria
    @Published var users: [UserModel] = []

    // Usuario autenticado actual (nil = nadie ha iniciado sesión)
    @Published var currentUser: UserModel?

    func emailExists(_ email: String) -> Bool {
        users.contains { $0.email.lowercased() == email.lowercased() }
    }

    func logout() {
        currentUser = nil
    }
}
