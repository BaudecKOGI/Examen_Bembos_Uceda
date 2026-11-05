import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color.bembosBlue
                    .ignoresSafeArea()

                ScrollView {
                    // Aumentamos el espaciado general a 30
                    VStack(spacing: 30) {
                        
                        Spacer().frame(height: 20) // Margen superior extra
                        
                        BembosLogoView(size: 220) // Logo un poco más grande

                        Text("INICIAR SESIÓN")
                            .font(.custom("AvenirNextCondensed-HeavyItalic", size: 38))
                            .foregroundColor(.bembosCream)
                            .padding(.bottom, 10)

                        // Más espacio entre los campos de texto
                        VStack(spacing: 18) {
                            TextField(
                                "Correo",
                                text: $viewModel.email,
                                prompt: Text("Correo electrónico").foregroundColor(.gray)
                            )
                            .keyboardType(.emailAddress)
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.bembosCream)
                            .clipShape(RoundedRectangle(cornerRadius: 14))

                            SecureField(
                                "Contraseña",
                                text: $viewModel.password,
                                prompt: Text("Contraseña").foregroundColor(.gray)
                            )
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.bembosCream)
                            .clipShape(RoundedRectangle(cornerRadius: 14))
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

                        if viewModel.isLoggedIn {
                            Text("Inicio de sesión correcto")
                                .font(.custom("AvenirNextCondensed-DemiBold", size: 18))
                                .foregroundColor(.bembosBlue)
                                .frame(maxWidth: .infinity)
                                .padding(12)
                                .background(Color.bembosYellow)
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                        }

                        Button {
                            viewModel.login()
                        } label: {
                            Text("INGRESAR")
                                .font(.custom("AvenirNextCondensed-HeavyItalic", size: 24))
                                // Si los campos están vacíos, el texto es gris, si no, es azul
                                .foregroundColor(viewModel.areFieldsEmpty ? .gray : .bembosBlue)
                                .frame(maxWidth: .infinity)
                                .padding()
                                // Si está vacío, el fondo es crema transparente, si no, amarillo
                                .background(viewModel.areFieldsEmpty ? Color.bembosCream.opacity(0.3) : Color.bembosYellow)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                        .disabled(viewModel.areFieldsEmpty)
                        // Quitamos el .opacity para que no se vea ese color morado feo

                        NavigationLink {
                            RegisterView()
                        } label: {
                            Text("¿No tienes cuenta? Regístrate")
                                .font(.custom("AvenirNextCondensed-DemiBold", size: 20))
                                .foregroundColor(.bembosYellow)
                        }
                        .padding(.top, 10)
                        
                        Spacer().frame(height: 40) // Margen inferior
                    }
                    .padding(.horizontal, 24)
                }
            }
        }
        .tint(.bembosYellow)
    }
}

#Preview {
    LoginView()
}
