import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterViewModel()
    @EnvironmentObject var session: SessionViewModel

    var body: some View {
        ZStack {
            Color.bembosBlue
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 20) {
                    BembosLogoView(size: 140)

                    Text("CREAR CUENTA")
                        .font(.custom("AvenirNextCondensed-HeavyItalic", size: 36))
                        .foregroundColor(.bembosCream)

                    VStack(spacing: 14) {
                        TextField(
                            "Nombre",
                            text: $viewModel.name,
                            prompt: Text("Nombre completo").foregroundColor(.gray)
                        )
                        .textInputAutocapitalization(.words)
                        .bembosField()

                        TextField(
                            "Correo",
                            text: $viewModel.email,
                            prompt: Text("Correo electrónico").foregroundColor(.gray)
                        )
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .bembosField()

                        SecureField(
                            "Contraseña",
                            text: $viewModel.password,
                            prompt: Text("Contraseña").foregroundColor(.gray)
                        )
                        .bembosField()

                        SecureField(
                            "Confirmar contraseña",
                            text: $viewModel.confirmPassword,
                            prompt: Text("Confirmar contraseña").foregroundColor(.gray)
                        )
                        .bembosField()
                    }

                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .font(.custom("AvenirNextCondensed-DemiBold", size: 18))
                            .foregroundColor(.bembosRed)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .background(Color.bembosCream)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    if !viewModel.successMessage.isEmpty {
                        Text(viewModel.successMessage)
                            .font(.custom("AvenirNextCondensed-HeavyItalic", size: 22))
                            .foregroundColor(.bembosBlue)
                            .frame(maxWidth: .infinity)
                            .padding(12)
                            .background(Color.bembosYellow)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }

                    Button {
                        viewModel.register(session: session)
                    } label: {
                        Text("REGISTRARME")
                            .font(.custom("AvenirNextCondensed-HeavyItalic", size: 24))
                            .foregroundColor(.bembosBlue)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.bembosYellow)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                    }
                    .disabled(viewModel.isRegistered)
                    .opacity(viewModel.isRegistered ? 0.5 : 1)
                }
                .padding(24)
            }
        }
    }
}

private extension View {
    func bembosField() -> some View {
        self
            .foregroundColor(.black)
            .padding()
            .background(Color.bembosCream)
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

#Preview {
    RegisterView()
        .environmentObject(SessionViewModel())
}
