import SwiftUI

@main
struct MyApp: App {
    
    init() {
        // Adjusts the font size of the title to fit.
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    // On macOS, the title bar is hidden.
                    #if targetEnvironment(macCatalyst)
                        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.windowScene?.titlebar?.titleVisibility = .hidden
                    #endif
                }
        }
    }
}
