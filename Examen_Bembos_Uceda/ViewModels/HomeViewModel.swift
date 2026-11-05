import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {

    @Published var items: [ItemModel] = [
        ItemModel(
            name: "Hamburguesa Clásica",
            subtitle: "Carne, lechuga, tomate y mayonesa",
            description: "La hamburguesa de siempre, con carne jugosa a la parrilla, lechuga fresca, tomate y mayonesa en pan suave.",
            category: "Hamburguesas",
            price: 14.90,
            calories: 520,
            imageName: "img_clasica"
        ),
        ItemModel(
            name: "Hamburguesa Doble",
            subtitle: "Doble carne y queso fundido",
            description: "Dos carnes a la parrilla con queso fundido, lechuga y tomate para quienes tienen mucha hambre.",
            category: "Hamburguesas",
            price: 19.90,
            calories: 780,
            imageName: "img_doble"
        ),
        ItemModel(
            name: "Hamburguesa Extrema",
            subtitle: "Tocino, queso y salsa especial",
            description: "Carne a la parrilla con tocino crocante, queso y una salsa especial con mucho sabor.",
            category: "Hamburguesas",
            price: 22.90,
            calories: 850,
            imageName: "img_extrema"
        ),
        ItemModel(
            name: "Hamburguesa Royal",
            subtitle: "Carne, huevo frito y queso",
            description: "Carne a la parrilla acompañada de huevo frito, queso y vegetales frescos.",
            category: "Hamburguesas",
            price: 18.90,
            calories: 690,
            imageName: "img_royal"
        ),
        ItemModel(
            name: "Hamburguesa a lo Pobre",
            subtitle: "Plátano frito y huevo",
            description: "Una versión criolla con carne a la parrilla, plátano frito y huevo sobre pan suave.",
            category: "Hamburguesas",
            price: 20.90,
            calories: 740,
            imageName: "img_pobre"
        ),
        ItemModel(
            name: "Pollo Crispy",
            subtitle: "Pechuga crocante con mayonesa",
            description: "Pechuga de pollo empanizada y crocante con lechuga, tomate y mayonesa.",
            category: "Pollo",
            price: 16.90,
            calories: 610,
            imageName: "img_pollo"
        ),
        ItemModel(
            name: "Papas Bembos",
            subtitle: "Papas fritas crocantes",
            description: "Porción de papas fritas doradas y crocantes, perfectas para acompañar tu hamburguesa.",
            category: "Acompañamientos",
            price: 8.90,
            calories: 380,
            imageName: "img_papas"
        ),
        ItemModel(
            name: "Nuggets de Pollo",
            subtitle: "10 piezas con salsa a elección",
            description: "Diez nuggets de pollo bien dorados, servidos con tu salsa favorita.",
            category: "Acompañamientos",
            price: 12.90,
            calories: 450,
            imageName: "img_nuggets"
        ),
        ItemModel(
            name: "Milkshake de Vainilla",
            subtitle: "Cremoso y bien frío",
            description: "Batido cremoso de vainilla servido bien frío, ideal para cerrar tu pedido.",
            category: "Bebidas",
            price: 9.90,
            calories: 420,
            imageName: "img_milkshake"
        ),
        ItemModel(
            name: "Inca Kola 500 ml",
            subtitle: "La bebida de sabor original",
            description: "Botella personal de Inca Kola bien helada.",
            category: "Bebidas",
            price: 5.50,
            calories: 210,
            imageName: "img_incakola"
        )
    ]

    @Published var searchText = ""

    // Lista filtrada: se recalcula solo cuando cambia el texto o los items
    @Published private(set) var filteredItems: [ItemModel] = []

    init() {
        $searchText
            .combineLatest($items)
            .map { text, items in
                let cleanText = text.trimmingCharacters(in: .whitespaces)

                if cleanText.isEmpty {
                    return items
                }

                return items.filter {
                    $0.name.localizedCaseInsensitiveContains(cleanText) ||
                    $0.subtitle.localizedCaseInsensitiveContains(cleanText) ||
                    $0.category.localizedCaseInsensitiveContains(cleanText)
                }
            }
            .assign(to: &$filteredItems)
    }
}
