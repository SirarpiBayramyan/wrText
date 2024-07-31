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

  static var loginReg: Self {
    PrimaryButtonStyle(bgColor: .wrBlue2)
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
      .foregroundStyle(Color.white)  
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
