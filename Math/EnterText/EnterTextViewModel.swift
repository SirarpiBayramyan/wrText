//
//  EnterTextViewModel.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 25.07.24.
//

import SwiftUI
import Combine

class EnterTextViewModel: ObservableObject {
  @Published var text: String = ""
  @Published var responseText: String = ""
  @Published var shouldShowError: Bool = false
  @Published var shouldShowResponse: Bool = false
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    $text
      .map { $0.isEmpty }
      .assign(to: \.shouldShowError, on: self)
      .store(in: &cancellables)

  }
  
  @MainActor
  func fetchResponse() async {
    guard !text.isEmpty else {
      shouldShowError = true
      return
    }
    shouldShowError = false
    shouldShowResponse = true
    do {
      responseText = try await GPTNetwork().getGPTResponse(subject: text)
    } catch {
      responseText = "Error fetching response"
    }
    LoadingManager.shared.isLoading = false
  }
}
