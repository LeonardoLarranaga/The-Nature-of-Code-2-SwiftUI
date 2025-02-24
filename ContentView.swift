import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            Form {
                Section("Chapter 0: Randomness") {
                    NavigationLink("0.1 - A Traditional Random Walk", destination: TraditionalRandomWalk())
                    NavigationLink("0.2 - A Random-Number Distribution", destination: RandomNumberDistribution())
                    NavigationLink("0.3 - A Walker That Tends to Move to the Right", destination: WalkerTendsMoveRight())
                    NavigationLink("0.4 - A Gaussian Distribution", destination: GaussianDistribution())
                }
            }
            .formStyle(.grouped)
            .navigationTitle("Nature of Code")
        } detail: {
            Text("Select an example from the list.")
        }
    }
}
