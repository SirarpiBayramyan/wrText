//
//  CameraView.swift
//  Math
//
//  Created by Sirarpi Bayramyan on 24.07.24.
//

import AVFoundation
import SwiftUI
import UIKit
import Vision

struct CameraView: UIViewControllerRepresentable {
  var didDetectText: ([VNRecognizedTextObservation]) -> Void

  class Coordinator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    var parent: CameraView

    init(parent: CameraView) {
      self.parent = parent
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
      guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }

      let request = VNRecognizeTextRequest { request, error in
        if let error = error {
          print("Failed to recognize text: \(error.localizedDescription)")
          return
        }

        guard let results = request.results as? [VNRecognizedTextObservation] else { return }

        DispatchQueue.main.async {
          self.parent.didDetectText(results)
        }
      }

      request.recognitionLevel = .accurate
      let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, orientation: .up, options: [:])

      do {
        try handler.perform([request])
      } catch {
        print("Failed to perform text recognition request: \(error.localizedDescription)")
      }
    }
  }

  func makeCoordinator() -> Coordinator {
    Coordinator(parent: self)
  }

  func makeUIViewController(context: Context) -> UIViewController {
    let viewController = UIViewController()
    let captureSession = AVCaptureSession()
    captureSession.sessionPreset = .photo

    guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return viewController }
    let videoInput: AVCaptureDeviceInput

    do {
      videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
    } catch {
      return viewController
    }

    if captureSession.canAddInput(videoInput) {
      captureSession.addInput(videoInput)
    } else {
      return viewController
    }

    let videoOutput = AVCaptureVideoDataOutput()
    videoOutput.setSampleBufferDelegate(context.coordinator, queue: DispatchQueue(label: "videoQueue"))
    if captureSession.canAddOutput(videoOutput) {
      captureSession.addOutput(videoOutput)
    } else {
      return viewController
    }

    let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    previewLayer.frame = viewController.view.bounds
    previewLayer.videoGravity = .resizeAspectFill
    viewController.view.layer.addSublayer(previewLayer)

    captureSession.startRunning()

    return viewController
  }

  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
