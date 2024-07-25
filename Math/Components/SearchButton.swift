//
//  SearchButton.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 18.07.24.
//

import SwiftUI

struct SearchButton: View {

  private var action: () -> Void
  
  init(action: @escaping () -> Void) {
    self.action = action
  }

  var body: some View {
    Button("Search") {
      action()
    }
    .buttonStyle(.primary)
  }
}

#Preview {
  SearchButton(action: {})
}
