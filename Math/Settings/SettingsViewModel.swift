//
//  SettingsViewModel.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 02.08.24.
//

import Foundation
import Combine

enum AppLanguage: String, CaseIterable, Identifiable {

  case english = "en"
  case spanish = "es"
  case french = "fr"
  case armenian = "hy"
  case russian = "ru"

  var displayName: String {
    switch self {
    case .english: return "English"
    case .spanish: return "Español"
    case .french: return "Français"
    case .russian: return "Русский"
    case .armenian: return "Հայերեն"
    }
  }

  var id: String { self.rawValue }
}

class SettingsViewModel: ObservableObject {
  
  @Published var selectedLanguage: AppLanguage {
    didSet {
      UserDefaults.standard.set(selectedLanguage.rawValue, forKey: "AppLanguage")
      Bundle.setLanguage(selectedLanguage.rawValue)
    }
  }

  init() {
    let savedLanguage = UserDefaults.standard.string(forKey: "AppLanguage") ?? AppLanguage.english.rawValue
    self.selectedLanguage = AppLanguage(rawValue: savedLanguage) ?? .english
  }

}

