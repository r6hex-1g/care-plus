import SwiftUI

struct ContentView: View {
    var body: some View {
        #if os(iOS)
        WelcomeView()
        #endif
    }
}
