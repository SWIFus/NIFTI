//
//  ViewController.swift
//  QRCodeScanner2
//
//  Created by 김태우 on 2022/08/06.
//

import UIKit
import AVFoundation

class QRCodeScannerViewController: UIViewController {
    
    var qrCodeView: UIView = {
        var tempFrameView = UIView()
        tempFrameView.layer.borderColor = UIColor.green.cgColor
        tempFrameView.layer.borderWidth = 2
        
        return tempFrameView
    }()
    
    var captureSession = AVCaptureSession()
    var cameraDevice: AVCaptureDevice?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initCameraDevice()
        initCameraInputData()
        initCameraOutputData()
        displayPreview()
        initQRCodeFrameView()
    }

    private func initQRCodeFrameView() {
        self.view.addSubview(qrCodeView)
        self.view.bringSubviewToFront(qrCodeView)
    }

    private func initCameraDevice() {
        guard let captureDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            print("Failed to get the camera video")
            return
        }
        
        cameraDevice = captureDevice
    }

    
    private func initCameraInputData() {
        if let cameraDevice = self.cameraDevice {
            do {
                let input = try AVCaptureDeviceInput(device: cameraDevice)
                if captureSession.canAddInput(input) { captureSession.addInput(input) }
            } catch {
                print(error.localizedDescription)
                return
            }
        }
    }
    
    private func initCameraOutputData() {
        let captureMedataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(captureMedataOutput) {
            captureSession.addOutput(captureMedataOutput)
        }
        
        captureMedataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        captureMedataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
    }
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    private func displayPreview() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        DispatchQueue.main.async {
            self.videoPreviewLayer?.frame = self.view.layer.bounds
            self.view.layer.addSublayer(self.videoPreviewLayer!)
        }
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
    }
}

extension QRCodeScannerViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 {
            self.qrCodeView.transform = CGAffineTransform(scaleX: 0, y: 0)
            return
        }
        
        guard let metaDataObj = metadataObjects[0] as? AVMetadataMachineReadableCodeObject else {
            print("FAIL")
            return
        }
        
        if metaDataObj.type == .qr {
            let qrCodeObject = videoPreviewLayer?.transformedMetadataObject(for: metaDataObj)
            
            self.qrCodeView.frame = qrCodeObject!.bounds
            
            UIView.animate(withDuration: 0.5) {
                self.qrCodeView.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            
            guard let qrCodeStringData = metaDataObj.stringValue else { return }
            
            print(qrCodeStringData)
        }
    }
}
