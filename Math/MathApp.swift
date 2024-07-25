
import SwiftUI

@main
struct MathApp: App {
    var body: some Scene {
        WindowGroup {
          MainView()
            .environmentObject(LoadingManager.shared)
        }
    }
}

