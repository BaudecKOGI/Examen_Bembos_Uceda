import SwiftUI
import Combine

@MainActor
final class RegisterViewModel: ObservableObject {

    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage = ""
    @Published var successMessage = ""
    @Published var isRegistered = false

    func register(session: SessionViewModel) {
        errorMessage = ""
        successMessage = ""

        let cleanName = name.trimmingCharacters(in: .whitespaces)
        let cleanEmail = email.trimmingCharacters(in: .whitespaces)

        guard !cleanName.isEmpty,
              !cleanEmail.isEmpty,
              !password.isEmpty,
              !confirmPassword.isEmpty else {
            errorMessage = "Completa todos los campos"
            return
        }

        guard FormValidator.isValidEmail(cleanEmail) else {
            errorMessage = "Ingresa un correo electrónico válido"
            return
        }

        guard !session.emailExists(cleanEmail) else {
            errorMessage = "Este correo ya está registrado"
            return
        }

        if let passwordError = FormValidator.passwordError(password) {
            errorMessage = passwordError
            return
        }

        guard password == confirmPassword else {
            errorMessage = "Las contraseñas no coinciden"
            return
        }

        let newUser = UserModel(name: cleanName, email: cleanEmail, password: password)
        session.users.append(newUser)

        successMessage = "Cuenta creada"
        isRegistered = true

        // Se muestra el mensaje de éxito y luego se va al Home
        Task {
            try? await Task.sleep(nanoseconds: 1_500_000_000)
            session.currentUser = newUser
        }
    }
}
