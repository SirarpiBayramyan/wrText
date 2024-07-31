//
//  RegistrationView.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 30.07.24.
//

import SwiftUI

struct RegistrationView: View {

  @StateObject private var viewModel = RegistrationViewModel()

    var body: some View {
      BackgroundView {
        VStack {
          Spacer()
          Image("register")
            .resizable()
            .frame(width: 150, height: 70)
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

            SecureField("Repeat Password", text: $viewModel.repeatPassword)
              .padding()
              .background(Color.wrBlue.opacity(0.8))
              .cornerRadius(20.0)
              .shadow(radius: 10.0, x: 20, y: 10)
          }

          Spacer()

          Button(action: {
            print("sign up")
          }) {
            Text("Sign up")
              .font(.headline)
              .foregroundStyle(.white)
              .padding()
              .frame(width: 300, height: 50)
              .cornerRadius(15.0)
              .shadow(radius: 10.0, x: 20, y: 10)
          }
          .buttonStyle(.loginReg)
          .padding(.bottom, 36)
        }
        .padding(.horizontal, 28)
      }
    }
}

#Preview {
    RegistrationView()
}
