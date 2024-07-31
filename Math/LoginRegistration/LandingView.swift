//
//  LandingView.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 26.07.24.
//

import SwiftUI

struct LandingView: View {
  var body: some View {
    NavigationStack {
      BackgroundView(shouldShowBackButton: false) {
        VStack {
          Spacer()
          Image("appIcon")
            .frame(width: 150, height: 150)


          Spacer()
          VStack(spacing: 24) {
            NavigationLink(
              destination: LoginView()
            ) {
              Text("Login")
            }

            NavigationLink(destination:  RegistrationView()) {
              Text("Registration")
            }
          }
          .buttonStyle(.primary)

          Spacer()
          NavigationLink(destination: AboutAppView()) {
            Image("about")
          }
          .padding(.horizontal, 32)
          .padding(.bottom, 24)
        }
      }
      .padding(.horizontal, 24)
    }
  }
}

#Preview {
  LandingView()
}
