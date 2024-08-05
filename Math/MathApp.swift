
import SwiftUI

@main
struct MathApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var languageManager = LanguageManager()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(languageManager)
                .environmentObject(LoadingManager.shared)
        }
    }
  
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        Bundle.setLanguage(Bundle.currentLanguage())
        return true
    }
}

