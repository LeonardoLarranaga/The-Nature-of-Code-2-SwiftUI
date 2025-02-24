import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            Form {
                Section("Chapter 0: Randomness") {
                    NavigationLink("0.1 - A Traditional Random Walk", destination: TraditionalRandomWalk())
                    NavigationLink("0.2 - A Random-Number Distribution", destination: RandomNumberDistribution())
                }
            }
            .formStyle(.grouped)
            .navigationTitle("Nature of Code")
        } detail: {
            Text("Select an example from the list.")
        }
    }
}
