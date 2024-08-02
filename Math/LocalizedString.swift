
import Foundation

public extension String {
  
  /// Localized string
  /// - Parameter args: args for string
  /// - Returns: localized string
  func localized(args: String...) -> String {
    return String(format: localized(), arguments: args)
  }
  
  /// Localized string
  /// - Parameter arg: argument for string
  /// - Returns: localized string
  func localized(arg: String) -> String {
    return String(format: localized(), arguments: [arg])
  }
  
  /// Localized string
  /// - Returns: localized string
  func localized() -> String {
    return NSLocalizedString(self, bundle: Bundle.main, comment: "")
  }
  
}

extension Bundle {
  static var bundleKey: UInt8 = 0
  
  static func setLanguage(_ language: String) {
    defer {
      object_setClass(Bundle.main, BundleEx.self)
    }
    
    objc_setAssociatedObject(Bundle.main, &bundleKey, Bundle.main.path(forResource: language, ofType: "lproj"), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
  }
}

private class BundleEx: Bundle {
  override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
    guard let bundlePath = objc_getAssociatedObject(self, &Bundle.bundleKey) as? String,
          let bundle = Bundle(path: bundlePath) else {
      return super.localizedString(forKey: key, value: value, table: tableName)
    }
    
    return bundle.localizedString(forKey: key, value: value, table: tableName)
  }
}
