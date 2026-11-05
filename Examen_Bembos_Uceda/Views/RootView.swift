import SwiftUI

struct RootView: View {
    @EnvironmentObject var session: SessionViewModel

    var body: some View {
        if session.currentUser != nil {
            HomeView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    RootView()
        .environmentObject(SessionViewModel())
}
