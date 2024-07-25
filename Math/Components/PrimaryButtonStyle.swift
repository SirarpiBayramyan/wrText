//
//  PrimaryButtonStyle.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 18.07.24.
//

import SwiftUI

extension ButtonStyle where Self == PrimaryButtonStyle {

  static var primary: Self {
    PrimaryButtonStyle(bgColor: .wrBlue)
  }
}

struct PrimaryButtonStyle: ButtonStyle {

  @Environment(\.isEnabled) private var isEnabled

  private var bgColor: Color
  
  init(bgColor: Color) {
    self.bgColor = bgColor
  }
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .font(.headline)
      .foregroundStyle(Color.white)  // Set text color to black
      .frame(maxWidth: .infinity)
      .frame(height: 36)
      .background {
        RoundedRectangle(
          cornerRadius: 15,
          style: .circular
        )
        .fill(bgColor)
      }
  }

}

#Preview {
  Button("button", action: {})
    .buttonStyle(PrimaryButtonStyle(bgColor: .wrBlue))
}
