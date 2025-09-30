//
//  Bundle.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 05.08.24.
//

import Foundation

// MARK: - Bundle Extension for Language Setting

extension Bundle {
  
  private static var bundleKey: UInt8 = 0
  
  static func setLanguage(_ language: String) {
    UserDefaults.standard.set(language, forKey: "AppLanguage")
    UserDefaults.standard.synchronize()
    
    object_setClass(Bundle.main, BundleEx.self)
    objc_setAssociatedObject(Bundle.main, &bundleKey, Bundle.main.path(forResource: language, ofType: "lproj"), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
  }
  
  
  static func currentLanguage() -> String {
     UserDefaults.standard.string(forKey: "AppLanguage") ?? Locale.current.languageCode ?? "en"
  }
  
  // MARK: - Custom Bundle for Language Swizzling
  
  private class BundleEx: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
      guard let bundlePath = objc_getAssociatedObject(self, &Bundle.bundleKey) as? String,
            let bundle = Bundle(path: bundlePath) else {
        return super.localizedString(forKey: key, value: value, table: tableName)
      }
      
      return bundle.localizedString(forKey: key, value: value, table: tableName)
    }
  }
  
}
