import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject var session: SessionViewModel

    var body: some View {
        NavigationStack {
            ZStack {
                // Fondo gris muy claro
                Color(red: 0.96, green: 0.96, blue: 0.97)
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    
                    // Barra de búsqueda personalizada (blanca y limpia)
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Buscar en el menú", text: $viewModel.searchText)
                            .font(.custom("AvenirNextCondensed-Regular", size: 16))
                            .foregroundColor(.black)
                            .autocorrectionDisabled()
                            .textInputAutocapitalization(.never)
                    }
                    .padding(12)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    .padding(.bottom, 15)

                    ScrollView {
                        LazyVStack(spacing: 16) {
                            
                            // Saludo
                            VStack(alignment: .leading, spacing: 4) {
                                Text("¡Hola, \(session.currentUser?.name ?? "")!")
                                    .font(.custom("AvenirNextCondensed-HeavyItalic", size: 26))
                                    .foregroundColor(.black)
                                Text("¿Qué se te antoja hoy?")
                                    .font(.custom("AvenirNextCondensed-DemiBold", size: 18))
                                    .foregroundColor(.gray)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 5)

                            // Lista de productos
                            ForEach(viewModel.filteredItems) { item in
                                NavigationLink(value: item) {
                                    ItemRowView(item: item)
                                }
                                .buttonStyle(.plain)
                                .padding(.horizontal, 16)
                            }
                        }
                        .padding(.bottom, 20)
                    }
                    .overlay {
                        if viewModel.filteredItems.isEmpty {
                            Text("No se encontraron resultados")
                                .font(.custom("AvenirNextCondensed-DemiBold", size: 20))
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationDestination(for: ItemModel.self) { item in
                ItemDetailView(item: item)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("MENÚ")
                        .font(.custom("AvenirNextCondensed-HeavyItalic", size: 28))
                        .foregroundColor(.white)
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        session.logout()
                    } label: {
                        Text("Salir")
                            .font(.custom("AvenirNextCondensed-HeavyItalic", size: 18))
                            .foregroundColor(.bembosYellow)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.white.opacity(0.15)) // Un fondito sutil transparente
                            .clipShape(Capsule())
                    }
                    .buttonStyle(.plain) // Esto quita el fondo feo por defecto
                }
            }
            .toolbarBackground(Color.bembosBlue, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
        }
        // Quitamos el .tint global para que no altere los colores internos
    }
}

#Preview {
    HomeView()
        .environmentObject(SessionViewModel())
}
