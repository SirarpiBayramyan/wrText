//
//  MainView.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 17.07.24.
//

import SwiftUI

struct MainView: View {

  var body: some View {
    NavigationView {
      BackgroundView(shouldShowBackButton: false) {
        VStack(spacing: 32) {
          Spacer()
          Image("appIcon")
          Spacer()
          VStack(alignment: .center, spacing: 24) {
            NavigationLink(destination: EnterTextView()) {
              Text("Enter text")
            }

            NavigationLink(destination: ReadTextFromImageView()) {
              Text("Read text")
            }

            NavigationLink(destination: ScanTextWithCameraView()) {
              Text("Scan text")
            }

          }
          .buttonStyle(.primary)
          .padding(.horizontal, 40)

          Spacer()
          
        }
      }
    }
  }
}

#Preview {
  MainView()
}
