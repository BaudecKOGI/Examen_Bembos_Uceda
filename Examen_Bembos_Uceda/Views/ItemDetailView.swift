import SwiftUI

struct ItemDetailView: View {
    let item: ItemModel

    var body: some View {
        ZStack {
            // Fondo general limpio
            Color(red: 0.96, green: 0.96, blue: 0.97)
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 0) {
                    
                    // Imagen del producto (ahora respeta la barra de arriba)
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit() // Mantiene la proporción real de la foto
                        .frame(maxWidth: .infinity)
                        .frame(height: 250) // Altura fija para que no sea gigante
                        .background(Color.white) // Fondo blanco por si la foto es transparente
                        .clipped()
                    
                    VStack(alignment: .leading, spacing: 16) {
                        
                        // Título y Precio
                        HStack(alignment: .top) {
                            Text(item.name)
                                .font(.custom("AvenirNextCondensed-HeavyItalic", size: 32))
                                .foregroundColor(.black)
                            
                            Spacer()
                            
                            Text("S/ \(item.price, specifier: "%.2f")")
                                .font(.custom("AvenirNextCondensed-HeavyItalic", size: 28))
                                .foregroundColor(.bembosBlue)
                        }
                        
                        // Categoría
                        Text(item.category.uppercased())
                            .font(.custom("AvenirNextCondensed-DemiBold", size: 14))
                            .foregroundColor(.gray)
                            .tracking(1.5)
                        
                        Divider()
                        
                        // Descripción
                        Text(item.description)
                            .font(.custom("AvenirNextCondensed-Regular", size: 18))
                            .foregroundColor(.black.opacity(0.7))
                            .lineSpacing(6)
                        
                        // Atributos
                        HStack(spacing: 12) {
                            HStack {
                                Image(systemName: "flame.fill")
                                    .foregroundColor(.orange)
                                Text("\(item.calories) kcal")
                                    .font(.custom("AvenirNextCondensed-DemiBold", size: 16))
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(Color(red: 0.96, green: 0.96, blue: 0.97))
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                            
                            Spacer()
                        }
                        .padding(.top, 4)
                        
                        // Botón
                        Button {
                            // Lógica del carrito
                        } label: {
                            Text("AGREGAR AL CARRITO")
                                .font(.custom("AvenirNextCondensed-HeavyItalic", size: 20))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.bembosBlue)
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        }
                        .padding(.top, 20)
                    }
                    .padding(24)
                    .background(Color.white)
                    // Redondeamos las esquinas superiores del contenido blanco
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .offset(y: -30) // Lo subimos un poquito para que se superponga a la imagen
                    .padding(.bottom, -30)
                }
            }
            // ¡Eliminamos el .ignoresSafeArea(edges: .top) que estaba aquí!
        }
        .navigationTitle("Detalle")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.bembosBlue, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}
