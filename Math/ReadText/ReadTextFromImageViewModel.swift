//
//  ReadTextFromImageViewModel.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 18.07.24.
//

import Combine
import SwiftUI
import PhotosUI
import Vision

class ReadTextFromImageViewModel: ObservableObject {

  @Published var selectedItem: PhotosPickerItem? = nil
  @Published var image: UIImage?
  @Published var selectedText: String = ""
  @Published var responseText: String = ""
  @Published var textObservations: [VNRecognizedTextObservation] = []
  
  init() {
    // Watch for changes to the selected item
    $selectedItem
      .compactMap { $0 }
      .sink { [weak self] newItem in
        self?.loadImage(from: newItem)
      }
      .store(in: &cancellables)
  }
  
  private var cancellables = Set<AnyCancellable>()
  
  func loadImage(from item: PhotosPickerItem) {
    Task {
      if let data = try? await item.loadTransferable(type: Data.self), let uiImage = UIImage(data: data) {
        self.image = uiImage
        self.detectText(in: uiImage)
      }
    }
  }
  
  func detectText(in image: UIImage) {
    guard let cgImage = image.cgImage else { return }
    
    let request = VNRecognizeTextRequest { (request, error) in
      guard let observations = request.results as? [VNRecognizedTextObservation] else {
        self.textObservations = []
        return
      }
      DispatchQueue.main.async {
        self.textObservations = observations
      }
    }
    
    request.recognitionLevel = .accurate
    
    let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
    
    DispatchQueue.global().async {
      do {
        try requestHandler.perform([request])
      } catch {
        DispatchQueue.main.async {
          self.textObservations = []
        }
      }
    }
  }

  @MainActor
  func fetchResponse() async {
    do {
      responseText = try await GPTNetwork().getGPTResponse(subject: selectedText)
    } catch {
      responseText = "Error fetching response"
    }
    LoadingManager.shared.isLoading = false
  }
}
