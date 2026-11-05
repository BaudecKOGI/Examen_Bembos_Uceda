import SwiftUI

struct ItemRowView: View {
    let item: ItemModel

    var body: some View {
        HStack(spacing: 16) {
            // Imagen del producto ajustada para que no se recorte
            Image(item.imageName)
                .resizable()
                .scaledToFit() // <-- Esto hace que se vea completa
                .frame(width: 90, height: 90)
                .background(Color(red: 0.96, green: 0.96, blue: 0.97)) // Fondo sutil por si la imagen no es cuadrada
                .clipShape(RoundedRectangle(cornerRadius: 16))
            
            VStack(alignment: .leading, spacing: 6) {
                Text(item.name)
                    .font(.custom("AvenirNextCondensed-HeavyItalic", size: 22))
                    .foregroundColor(.bembosBlue)
                
                Text(item.subtitle)
                    .font(.custom("AvenirNextCondensed-DemiBold", size: 15))
                    .foregroundColor(.gray)
                    .lineLimit(2)
                
                Text("S/ \(item.price, specifier: "%.2f")")
                    .font(.custom("AvenirNextCondensed-HeavyItalic", size: 20))
                    .foregroundColor(.black)
                    .padding(.top, 4)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.gray.opacity(0.5))
        }
        .padding(12)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
    }
}
