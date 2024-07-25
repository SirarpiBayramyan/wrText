
import SwiftUI
import VisionKit

class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
  let scannerView: ScannerView

  init(with scannerView: ScannerView) {
    self.scannerView = scannerView
  }
}

struct ScannerView: UIViewControllerRepresentable {

  func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
    let scannerViewController = VNDocumentCameraViewController()
    scannerViewController.delegate = context.coordinator
    return scannerViewController
  }


  func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {

  }

  func makeCoordinator() -> Coordinator {
    Coordinator(with: self)
  }

}

#Preview {
  ScannerView()
}
