# IdentAI

IdentAI is a Swift-based iOS application designed to classify images using machine learning techniques. By leveraging Apple's Core ML and Vision frameworks, IdentAI provides users with an intuitive interface to capture or select images and receive real-time classification predictions. The app aims to showcase the power of machine learning in image recognition tasks, providing insights into the contents of images through an easy-to-use application.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgments](#acknowledgments)
- [Download MobileNetV2](#download-mobilenetv2)

## Features

- **Image Classification**: Utilizes a pre-trained machine learning model to classify images.
- **Camera and Photo Library Access**: Users can take pictures using the device camera or select existing images from their photo library.
- **User-Friendly Interface**: Features a visually appealing design with a gradient background, rounded image display, and easy navigation.
- **Real-Time Predictions**: Provides immediate feedback on the classification results along with confidence levels.

## Requirements

- **iOS Version**: Requires iOS 13.0 or later
- **Xcode Version**: Requires Xcode 12.0 or later
- **Swift Version**: Swift 5.0 or later
- **Core ML and Vision Frameworks**: Integrated for machine learning capabilities

## Installation

To set up IdentAI on your local machine, follow these steps:

1. **Clone the Repository**:
   Open your terminal and run the following command:

   ```bash
   git clone https://github.com/dhanyakini/IdentAI-Object-Detection-App.git
   ```

2. **Open the Project in Xcode**:
   Navigate to the project directory and open the `.xcodeproj` file:

   ```bash
   cd IdentAI-Object-Detection-App
   open IdentAI.xcodeproj
   ```

3. **Install Dependencies** (if any):
   If the project requires additional dependencies, install them using CocoaPods or Swift Package Manager (if applicable).

4. **Build and Run the Application**:
   Select a simulator or a real device and click on the Run button in Xcode to build and launch the application.

## Usage

After launching the application, you can use it as follows:

1. **Capture an Image**:
   - Tap the camera icon to take a new picture using your device's camera.
  
2. **Select an Image**:
   - Alternatively, tap the photo library icon to choose an existing image from your device's photo library.

3. **View Classification Results**:
   - The app will analyze the selected image and display the predicted classification along with the confidence percentage in the user interface.

### Example Workflow

1. **Open the App**: Launch IdentAI on your device.
2. **Choose an Input Method**: Decide whether to capture a new image or select one from the library.
3. **View Results**: After the image is processed, the app will display the classification results, including the class label and confidence level.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- **Core ML**: For providing the tools to integrate machine learning models into iOS apps.
- **Vision Framework**: For image analysis and processing functionalities.
- **Apple Developer Documentation**: For extensive resources and guides.
- **Contributors**: Special thanks to all contributors for their help and support in enhancing the project.

## Download MobileNetV2

To use the MobileNetV2 model in your project, you can download it from the official Apple Machine Learning Models page:

[Download MobileNetV2](https://developer.apple.com/machine-learning/models/)
