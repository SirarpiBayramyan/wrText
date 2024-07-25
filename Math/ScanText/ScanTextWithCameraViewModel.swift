
import SwiftUI
import Vision

class ScanTextWithCameraViewModel: ObservableObject {

  @Published var detectedObservations: [VNRecognizedTextObservation] = []
  @Published var selectedText: String = ""
  @Published var responseText: String = ""

  func detectText(from observations: [VNRecognizedTextObservation]) {
    self.detectedObservations = observations
  }

  func selectText(_ text: String) {
    self.selectedText = text
  }

  @MainActor
  func fetchResponse() async {
    do {
      responseText = try await GPTNetwork().getGPTResponse(subject: selectedText)
    } catch {
      responseText = "Error fetching response"
    }
  }
}
