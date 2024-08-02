//
//  ReadTextFromImageView.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 18.07.24.
//

import SwiftUI
import PhotosUI

struct ReadTextFromImageView: View {

  @StateObject private var viewModel = ReadTextFromImageViewModel()
  

  var body: some View {
    BackgroundView {
      VStack {
        PhotosPicker(
          "wr-select-an-image".lowercased(),
          selection: $viewModel.selectedItem,
          matching: .images
        )

        if let image = viewModel.image {
          ZStack {
            VStack(spacing: 24) {
              Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                NavigationLink(
                  destination: ResponseView(
                    text: $viewModel.responseText,
                    requestedText: $viewModel.selectedText
                  )
                ) {
                  Text("wr-done".localized())
                }
                .simultaneousGesture(TapGesture().onEnded {
                  Task {
                    await viewModel.fetchResponse()
                  }
                })
                .disabled(viewModel.selectedText.isEmpty)
                .buttonStyle(.primary)
            }
            TextOverlayView(
              textObservations: viewModel.textObservations,
              imageSize: image.size,
              selectedText: $viewModel.selectedText
            )
          }
        } else {
          Text("wr-no-image".localized())
        }

        Spacer()
      }
      .padding()
    }
    
  }
}
