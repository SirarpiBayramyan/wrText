//
//  ResponseView.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 25.07.24.
//

import SwiftUI

struct ResponseView: View {

  @Binding var text: String
  @Binding var requestedText: String

  var body: some View {
    
    BackgroundView {
      VStack {
        VStack(alignment: .leading, spacing: 8){
          Text("Response")
            .font(.title)
            .foregroundStyle(.white)
          ZStack {
            ScrollView() {
              Text(text)
                .textSelection(.enabled)
                .lineLimit(nil)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(.wrBlue)

            }
          }
          .background {
            RoundedRectangle(
              cornerRadius: 4,
              style: .circular
            )
            .fill(
              .white.opacity(0.3)
            )
            .shadow(color: .wrBlue.opacity(0.5), radius: 1, x: 0, y: 2)
            .shadow(color: .wrBlue.opacity(0.15), radius: 5, x: 0, y: 0)

          }
        }

        .padding(.horizontal, 24)
        Spacer()
        Button("Try Again", action: {
          Task {
            text = try await GPTNetwork().getGPTResponse(subject: text)
          }
        })

      }
      .padding(.vertical, 36)
    }
    .onDisappear {
      text = ""
      requestedText = ""
    }
  }
}

#Preview {
  @State var text: String = "text"
  return ResponseView(text: $text, requestedText: $text)
}
