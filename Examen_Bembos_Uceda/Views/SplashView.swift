import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var logoScale: CGFloat = 0.6
    @State private var logoOpacity: Double = 0.0

    var body: some View {
        ZStack {
            if isActive {
                RootView()
                    .transition(.opacity)
            } else {
                splashContent
                    .transition(.opacity)
            }
        }
        .task {
            withAnimation(.easeOut(duration: 0.9)) {
                logoScale = 1.0
                logoOpacity = 1.0
            }

            try? await Task.sleep(nanoseconds: 2_000_000_000)

            withAnimation(.easeInOut(duration: 0.4)) {
                isActive = true
            }
        }
    }

    private var splashContent: some View {
        ZStack {
            Color.bembosBlue
                .ignoresSafeArea()

            VStack(spacing: 20) {
                // Logo mucho más grande
                BembosLogoView(size: 280)

                // Solo el eslogan
                Text("Las mejores hamburguesas")
                    .font(.custom("AvenirNextCondensed-DemiBold", size: 24))
                    .foregroundColor(.bembosYellow)
                    .padding(.top, 10)
            }
            .scaleEffect(logoScale)
            .opacity(logoOpacity)
        }
    }
}

#Preview {
    SplashView()
}
