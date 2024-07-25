//
//  TextOverlayView.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 24.07.24.
//

import SwiftUI
import Vision


struct TextOverlayView: View {
  var textObservations: [VNRecognizedTextObservation]
  var imageSize: CGSize
  @Binding var selectedText: String

  var body: some View {
    GeometryReader { geometry in
      ForEach(textObservations, id: \.self) { observation in
        if let topCandidate = observation.topCandidates(1).first {
          let boundingBox = observation.boundingBox
          let rect = convertRect(from: boundingBox, imageSize: imageSize, containerSize: geometry.size)

          Text(topCandidate.string)
            .padding(4)
            .background(
              selectedText == topCandidate.string
              ? Color.green.opacity(0.5) : Color.blue.opacity(0.3))
            .frame(width: rect.width, height: rect.height)
            .position(x: rect.midX, y: rect.midY)
            .onTapGesture {
              selectedText = topCandidate.string
            }
        }
      }
    }
  }

  private func convertRect(
    from boundingBox: CGRect,
    imageSize: CGSize,
    containerSize: CGSize
  ) -> CGRect {
    let size = CGSize(
      width: boundingBox.width * containerSize.width,
      height: boundingBox.height * containerSize.height
    )
    let origin = CGPoint(
      x: boundingBox.minX * containerSize.width,
      y: (1 - boundingBox.minY - boundingBox.height) * containerSize.height
    )
    return CGRect(origin: origin, size: size)
  }
}


#Preview {
  @State var selectedText: String = ""
  
  return TextOverlayView(
    textObservations: [],
    imageSize: .zero,
    selectedText: $selectedText)
  
}
