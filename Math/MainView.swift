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

          HStack {
            Spacer()
            NavigationLink(destination: EmptyView()) {
              Image("settings")
                .resizable()
                .frame(width: 34, height: 34)
                .foregroundStyle(Color.wrBlue)
            }
          }
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

          Spacer()
          NavigationLink(destination: AboutAppView()) {
            Image("about")
          }
          .padding(.horizontal, 32)

        }
        .padding(.horizontal, 40)
        .padding(.bottom, 4)
      }
    }
  }
}

#Preview {
  MainView()
}
