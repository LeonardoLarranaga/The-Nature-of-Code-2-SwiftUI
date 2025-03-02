import SwiftUI

@main
struct MyApp: App {
    init() { UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true }
    var body: some Scene {
        WindowGroup {
            ContentView()
            #if targetEnvironment(macCatalyst)
                .onAppear {
                    (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.windowScene?.titlebar?.titleVisibility = .hidden
                }
            #endif
        }
    }
}
