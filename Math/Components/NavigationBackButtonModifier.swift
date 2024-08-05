
import SwiftUI

struct NavigationBackButtonModifier: ViewModifier {
  @Environment(\.presentationMode) var presentationMode
  var shouldShowBackButton: Bool
  var isDisabled: Bool

  func body(content: Content) -> some View {
    content
      .navigationBarBackButtonHidden()
      .toolbar {
        if shouldShowBackButton {
          ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
              presentationMode.wrappedValue.dismiss()
            }) {
              Image(systemName: "arrow.backward")
                .font(.headline)
                .foregroundStyle(Color.wrBlue)
            }
            .disabled(isDisabled)
          }
        }
      }
  }
}

extension View {

  func customNavigationBackButton(
    shouldShowBackButton: Bool = true,
    isDisabled: Bool = false
  ) -> some View {
    self.modifier(
      NavigationBackButtonModifier(
        shouldShowBackButton: shouldShowBackButton,
        isDisabled: isDisabled
      )
    )
  }

}
