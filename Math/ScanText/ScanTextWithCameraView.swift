
import SwiftUI
import Vision

struct ScanTextWithCameraView: View {
  @StateObject private var viewModel = ScanTextWithCameraViewModel()
  
  var body: some View {
      VStack {
        Text("Detected Text")
          .font(.headline)
          .padding()

        // Display detected text in a list
        List(viewModel.detectedObservations, id: \.uuid) { observation in
          if let topCandidate = observation.topCandidates(1).first {
            Text(topCandidate.string)
              .padding()
              .background(
                viewModel.selectedText == topCandidate.string ?
                Color.green.opacity(0.5) : Color.clear
              )
              .onTapGesture {
                viewModel.selectText(topCandidate.string)
              }
          }
        }
        .padding()

        NavigationLink(
          destination: ResponseView(
            text: $viewModel.responseText,
            requestedText: $viewModel.selectedText
          )
        ) {
          Text("wr-done".localized())
        }
        .disabled(viewModel.selectedText.isEmpty)
        .buttonStyle(.primary)
        .simultaneousGesture(TapGesture().onEnded {
          Task {
            await viewModel.fetchResponse()
          }
          print(viewModel.selectedText)
        })
        .padding(32)
        // Display selected text
        Text("wr-selected-text".localized(args: viewModel.selectedText))
          .font(.body)
          .padding()


        CameraView { observations in
          viewModel.detectText(from: observations)
        }
        .edgesIgnoringSafeArea(.all)
      }
    }
}

struct ScanTextWithCameraView_Previews: PreviewProvider {
  static var previews: some View {
    ScanTextWithCameraView()
  }
}
