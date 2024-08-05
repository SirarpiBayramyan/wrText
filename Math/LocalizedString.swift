
import Foundation

public extension String {
  /// Localized string with arguments
  /// - Parameter args: arguments for the string
  /// - Returns: localized string
  func localized(args: CVarArg...) -> String {
    return String(format: localized(), arguments: args)
  }

  /// Localized string with a single argument
  /// - Parameter arg: argument for the string
  /// - Returns: localized string
  func localized(arg: CVarArg) -> String {
    return String(format: localized(), arguments: [arg])
  }

  /// Localized string without arguments
  /// - Returns: localized string
  func localized() -> String {
    return NSLocalizedString(self, bundle: Bundle.main, comment: "")
  }
}
