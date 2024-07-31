//
//  LoginView.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 26.07.24.
//

import SwiftUI

struct LoginView: View {

  @StateObject private var viewModel = LoginViewModel()

  var body: some View {
    BackgroundView {
      VStack {
        Spacer()
        Image("login")
          .resizable()
          .frame(width: 150, height: 100)
          .padding(.bottom, 50)

        VStack(alignment: .leading, spacing: 15) {
          TextField("Email", text: $viewModel.email)
            .padding()
            .background(Color.wrBlue.opacity(0.8))
            .cornerRadius(20.0)
            .shadow(radius: 10.0, x: 20, y: 10)

          SecureField("Password", text: $viewModel.password)
            .padding()
            .background(Color.wrBlue.opacity(0.8))
            .cornerRadius(20.0)
            .shadow(radius: 10.0, x: 20, y: 10)
        }

        Spacer()
        NavigationLink(destination:  MainView()) {
          Text("Sign In")
        }
        .buttonStyle(.loginReg)
        .padding(.bottom, 36)

        HStack(spacing: 0) {
          Text("Don't have an account? ")
          NavigationLink(destination: RegistrationView()) {
            Text("Sign Up")
          }
          .font(.headline)
          .foregroundStyle(.wrBlue)
        }
      }
      .padding(.horizontal, 28)
    }
  }
}

#Preview {
  LoginView()
}
