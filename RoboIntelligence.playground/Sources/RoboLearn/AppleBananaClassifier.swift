//
// AppleBananaClassifier.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML

/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
public class AppleBananaClassifierInput : MLFeatureProvider {

    /// Input image as color (kCVPixelFormatType_32BGRA) image buffer, 227 pixels wide by 227 pixels high
    public var image: CVPixelBuffer
    
    public var featureNames: Set<String> {
        get {
            return ["image"]
        }
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "image") {
            return MLFeatureValue(pixelBuffer: image)
        }
        return nil
    }
    
    public init(image: CVPixelBuffer) {
        self.image = image
    }
}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
public class AppleBananaClassifierOutput : MLFeatureProvider {

    /// Prediction probabilities as dictionary of strings to doubles
    public let fruitTypeProbability: [String : Double]

    /// Class label of top prediction as string value
    public let fruitType: String
    
    public var featureNames: Set<String> {
        get {
            return ["fruitTypeProbability", "fruitType"]
        }
    }
    
    public func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "fruitTypeProbability") {
            return try! MLFeatureValue(dictionary: fruitTypeProbability as [NSObject : NSNumber])
        }
        if (featureName == "fruitType") {
            return MLFeatureValue(string: fruitType)
        }
        return nil
    }
    
    public init(fruitTypeProbability: [String : Double], fruitType: String) {
        self.fruitTypeProbability = fruitTypeProbability
        self.fruitType = fruitType
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
public class AppleBananaClassifier {
    public var model: MLModel

    /**
        Construct a model with explicit path to mlmodel file
        - parameters:
           - url: the file url of the model
           - throws: an NSError object that describes the problem
    */
    public init(contentsOf url: URL) throws {
        self.model = try MLModel(contentsOf: url)
    }

    /// Construct a model that automatically loads the model from the app's bundle
    public convenience init() {
        let bundle = Bundle(for: AppleBananaClassifier.self)
        let assetPath = bundle.url(forResource: "Data/AppleBananaClassifier", withExtension:"mlmodelc")
        try! self.init(contentsOf: assetPath!)
    }

    /**
        Make a prediction using the structured interface
        - parameters:
           - input: the input to the prediction as AppleBananaClassifierInput
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as AppleBananaClassifierOutput
    */
    public func prediction(input: AppleBananaClassifierInput) throws -> AppleBananaClassifierOutput {
        let outFeatures = try model.prediction(from: input)
        let result = AppleBananaClassifierOutput(fruitTypeProbability: outFeatures.featureValue(for: "fruitTypeProbability")!.dictionaryValue as! [String : Double], fruitType: outFeatures.featureValue(for: "fruitType")!.stringValue)
        return result
    }

    /**
        Make a prediction using the convenience interface
        - parameters:
            - image: Input image as color (kCVPixelFormatType_32BGRA) image buffer, 227 pixels wide by 227 pixels high
        - throws: an NSError object that describes the problem
        - returns: the result of the prediction as AppleBananaClassifierOutput
    */
    public func prediction(image: CVPixelBuffer) throws -> AppleBananaClassifierOutput {
        let input_ = AppleBananaClassifierInput(image: image)
        return try self.prediction(input: input_)
    }
}
