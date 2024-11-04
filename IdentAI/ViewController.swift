//
//  ViewController.swift
//  IdentAI
//
//  Created by Dhanya Kini on 04/11/24.
//

import UIKit
import CoreML
import Vision

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Outlets for UI elements
    @IBOutlet weak var imageView: UIImageView!    // Displays the selected image
    let imagePicker = UIImagePickerController()    // Manages image selection from photo library
    
    // MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set a background gradient for visual appeal
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemTeal.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        // Customize the navigation bar appearance
        navigationController?.navigationBar.barTintColor = UIColor.systemBlue
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        // Configure the image picker settings
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
    }
    
    // MARK: - Image Picker Delegate Method
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Retrieve the selected image and display it in imageView
        if let userPickedImage = info[.originalImage] as? UIImage {
            imageView.image = userPickedImage
            imageView.layer.cornerRadius = 10     // Round corners for a polished look
            imageView.clipsToBounds = true        // Ensures the image is clipped to the rounded corners
            
            // Convert UIImage to CIImage for Core ML processing
            guard let ciImage = CIImage(image: userPickedImage) else {
                fatalError("Could not convert to CIImage")
            }
            
            // Perform image classification
            detect(image: ciImage)
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Core ML Model Prediction
    func detect(image: CIImage) {
        // Load a high-accuracy Core ML model (MobileNetV2)
        guard let model = try? VNCoreMLModel(for: MobileNetV2().model) else {
            fatalError("Loading CoreML Model Failed")
        }

        // Create a Vision request using the Core ML model
        let request = VNCoreMLRequest(model: model) { [weak self] request, error in
            // Retrieve the classification result with the highest confidence
            guard let results = request.results as? [VNClassificationObservation],
                  let firstResult = results.first else {
                fatalError("Model failed to process image")
            }

            // Update the UI with the prediction result
            DispatchQueue.main.async {
                let confidence = Int(firstResult.confidence * 100)   // Convert confidence to percentage
                self?.navigationItem.title = "\(firstResult.identifier) (\(confidence)%)"

            }
        }

        // Run the request on the input image
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }

    // MARK: - Camera Button Tapped
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        // Customize button appearance when tapped
        sender.tintColor = UIColor.white
        sender.customView?.backgroundColor = UIColor.systemBlue
        sender.customView?.layer.cornerRadius = 8
        
        // Create an alert to choose between Camera and Photo Library
        let alert = UIAlertController(title: "Select Image Source", message: "Choose an image source.", preferredStyle: .actionSheet)

        // Camera option
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }))
        }

        // Photo Library option
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { _ in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        // Cancel option
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // Present the alert
        present(alert, animated: true, completion: nil)
    }
}

