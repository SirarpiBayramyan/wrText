//
//  LanguageManager.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 05.08.24.
//
import SwiftUI

class LanguageManager: ObservableObject {
  
  @Published var currentLanguage: String
  
  init() {
    self.currentLanguage = Bundle.currentLanguage()
  }
  
  func setLanguage(_ language: String) {
    Bundle.setLanguage(language)
    self.currentLanguage = language
    
    // Reload the root view to reflect the language change
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
      windowScene.windows.first?.rootViewController = UIHostingController(rootView: MainView().environmentObject(self))
      windowScene.windows.first?.makeKeyAndVisible()
    }
  }
}
