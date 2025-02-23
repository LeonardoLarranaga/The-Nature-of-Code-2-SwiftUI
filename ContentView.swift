import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            Form {
                Section("Chapter 0: Randomness") {
                    NavigationLink("0.1 - A Traditional Random Walk", destination: TraditionalRandomWalk())
                }
            }
            .formStyle(.grouped)
            .navigationTitle("Nature of Code")
        } detail: {
            Text("Select an example from the list.")
        }
    }
}
