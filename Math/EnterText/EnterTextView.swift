//
//  EnterTextView.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 18.07.24.
//

import SwiftUI

struct EnterTextView: View {
  @StateObject private var viewModel = EnterTextViewModel()
  @FocusState private var isFocused: Bool


  var body: some View {
    BackgroundView {
      VStack {
        ZStack {
          TextField("Enter text here", text: $viewModel.text, axis: .vertical)
            .focused($isFocused)
            .font(.footnote)
            .foregroundStyle(.white)
            .padding(16)
          Spacer()
        }
        .background {
          RoundedRectangle(
            cornerRadius: 4,
            style: .circular
          )
          .fill(
            .wrBlue.opacity(0.3)
          )
          .shadow(color: .wrBlue.opacity(0.5), radius: 1, x: 0, y: 2)
          .shadow(color: .wrBlue.opacity(0.15), radius: 5, x: 0, y: 0)
        }
        .overlay {
          RoundedRectangle(
            cornerRadius: 4,
            style: .circular
          )
          .strokeBorder(
            .wrBlue.opacity(0.5),
            lineWidth: 1
          )
        }
        .onAppear{
          viewModel.shouldShowError = false
        }

        if viewModel.shouldShowError && !isFocused {
          Text("Search text is empty")
            .foregroundStyle(Color.red)
            .font(.body)
            .multilineTextAlignment(.leading)
        }

        Spacer()

        NavigationLink(
          destination: ResponseView(
            text: $viewModel.responseText,
            requestedText: $viewModel.text
          )
        ) {
          Text("Done")
        }
        .disabled(viewModel.text.isEmpty)
        .buttonStyle(.primary)
        .simultaneousGesture(TapGesture().onEnded {
          isFocused = false
          if viewModel.text.isEmpty {
            viewModel.shouldShowError = true
          } else {
            viewModel.shouldShowError = false
            viewModel.shouldShowResponse = true
            Task {
              await viewModel.fetchResponse()
            }
          }
        })
      }
      .padding(32)
    }
  }
}

#Preview {
  EnterTextView()
}
