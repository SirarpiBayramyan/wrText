//
//  BackgroundView.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 25.07.24.
//

import SwiftUI

public struct BackgroundView<Content: View>: View {

  @Environment(\.dismiss) private var dismiss

  private let imagename: String
  private let shouldShowBackButton: Bool
  private let content: Content

  public init(
    imageName: String = "background",
    shouldShowBackButton: Bool = true,
    @ViewBuilder content: () -> Content
  ) {
    self.imagename = imageName
    self.shouldShowBackButton = shouldShowBackButton
    self.content = content()
  }
  
  public var body: some View {
    ZStack {
      content
        .background {
          Image(imagename)
            .edgesIgnoringSafeArea(.all)
        }
        .navigationBarBackButtonHidden()
        .customNavigationBackButton(
          shouldShowBackButton: shouldShowBackButton,
          isDisabled: LoadingManager.shared.isLoading
        )

      LoadingOverlay()
    }
    .environmentObject(LoadingManager())
  }

}

#Preview {
  BackgroundView{
    Text("background")
  }
}


struct LoadingOverlay: View {
    @EnvironmentObject var loadingManager: LoadingManager

    var body: some View {
        if loadingManager.isLoading {
            ZStack {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    ProgressView("Loading...")
                        .padding()
                        .cornerRadius(10)
                        .shadow(radius: 10)
                }
            }
        }
    }
}

import Combine

class LoadingManager: ObservableObject {
    static let shared = LoadingManager()
    @Published var isLoading: Bool = false

     init() {}
}
