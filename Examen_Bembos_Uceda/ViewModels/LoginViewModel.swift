import SwiftUI
import Combine

final class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isLoggedIn = false

    // Datos válidos guardados de forma temporal
    @Published var savedEmail = ""
    @Published var savedPassword = ""

    var areFieldsEmpty: Bool {
        email.trimmingCharacters(in: .whitespaces).isEmpty || password.isEmpty
    }

    func login() {
        isLoggedIn = false
        errorMessage = ""

        let cleanEmail = email.trimmingCharacters(in: .whitespaces)

        guard FormValidator.isValidEmail(cleanEmail) else {
            errorMessage = "Ingresa un correo electrónico válido"
            return
        }

        if let passwordError = FormValidator.passwordError(password) {
            errorMessage = passwordError
            return
        }

        savedEmail = cleanEmail
        savedPassword = password
        isLoggedIn = true
    }
}
