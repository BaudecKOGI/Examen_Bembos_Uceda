import SwiftUI

struct BembosLogoView: View {
    var size: CGFloat = 240

    var body: some View {
        Image("bembos_logo")
            .resizable()
            .scaledToFit()
            .frame(width: size)
    }
}

#Preview {
    ZStack {
        Color.bembosBlue.ignoresSafeArea()
        BembosLogoView()
    }
}
