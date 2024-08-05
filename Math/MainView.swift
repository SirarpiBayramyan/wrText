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
            NavigationLink(destination: SettingsView()) {
              Image("settings")
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundStyle(Color.wrBlue)
            }
          }
          .padding(.top, 24)
          Spacer()
          Image("appIcon")
          Spacer()
          VStack(alignment: .center, spacing: 24) {
            NavigationLink(destination: EnterTextView()) {
              Text("wr-enter-text".localized())
            }

            NavigationLink(destination: ReadTextFromImageView()) {
              Text("wr-read-text".localized())
            }

            NavigationLink(destination: ScanTextWithCameraView()) {
              Text("wr-scan-text".localized())
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
