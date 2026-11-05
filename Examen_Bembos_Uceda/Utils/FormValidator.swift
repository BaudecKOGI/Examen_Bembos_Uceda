import Foundation

enum FormValidator {

    private static let specialCharacters = CharacterSet(charactersIn: "!@#$%^&*()_+-=[]{}|:<>?/¡¿")

    static func isValidEmail(_ value: String) -> Bool {
        let pattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: value)
    }

    // Devuelve un mensaje de error, o nil si la contraseña es válida
    static func passwordError(_ password: String) -> String? {
        if password.count < 6 {
            return "La contraseña debe tener mínimo 6 caracteres"
        }
        if password.rangeOfCharacter(from: .uppercaseLetters) == nil {
            return "La contraseña debe tener al menos una mayúscula"
        }
        if password.rangeOfCharacter(from: specialCharacters) == nil {
            return "La contraseña debe tener al menos un carácter especial (por ejemplo ! @ # $ %)"
        }
        return nil
    }
}
