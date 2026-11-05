import SwiftUI

@main
struct Examen_Bembos_UcedaApp: App {
    @StateObject private var session = SessionViewModel()

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(session)
        }
    }
}
