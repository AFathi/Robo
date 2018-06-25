//: # Robo Intelligence
//: An interactive scene that explains how machines learn.
/*:
 The interactive scene consists of **two** main parts:
 
 *1*. **Vision**, a part that demonstrates how machines learn to `see`.
 
 *2*. **Language Understanding**, a part that demonstrates how machines learn to `read`.
 
 Each of those parts demonstrate 2 different concepts in machine learning, which are:
 - *Convolutional Neural Networks (ConvNet Classifier)* for the **Vision** part. To create this classifier, I used [TuriCreate](https://github.com/apple/turicreate), an open source tool by Apple that simplifies the development of custom machine learning models.
 
 
 - *Naive Bayes (Bayes Classifier)* algorithm for the **Language Understanding** part. To create this classifier, I wrote it in Swift from scratch and used [NSLinguisticTagger](apple-reference-documentation://csfoundation.nslinguistictagger) to process the text input and break it into words, i.e. tokenize the text input.
*/

/*:
 ## Experience the interactive scene
 In order to test the scene, make sure to:
 
 *1*. Click execute playground
 
 ![run playground icon](Demo/runicon.png)

 *2*. Click show assistant editor

 ![assistant editor icon](Demo/assistanticon.png)

 ## Try out the classifiers
 
 ### Naive Bayes Classifier
 ```
 let classifier = MathBioClassifier()
 let result = classifier.predict("types of cells in living organisms")
 print(result)
 ```
 
 
 ### Convolutional Neural Networs Classifier
 ```
 let image = UIImage(named:"Data/Test Images/img_00.png")!
 let classifier = AppleBananaClassifier()
 if let buffer = image.buffer {
    do {
        let prediction = try classifier.prediction(image: buffer)
        print(prediction.fruitType)
    }catch{
        print(error)
    }
 }
 ```
 */

import PlaygroundSupport
import UIKit

// MARK: - Register custom fonts
let GtekFontPath = Bundle.main.url(forResource: "Fonts/RoboFont_Gtek", withExtension: "ttf")! as CFURL
let NunitoBoldPath = Bundle.main.url(forResource: "Fonts/Nunito-Bold", withExtension: "ttf")! as CFURL
let NunitoLightPath = Bundle.main.url(forResource: "Fonts/Nunito-Light", withExtension: "ttf")! as CFURL
let NunitoItalicPath = Bundle.main.url(forResource: "Fonts/Nunito-Italic", withExtension: "ttf")!  as CFURL
CTFontManagerRegisterFontsForURL(GtekFontPath, .process, nil)
CTFontManagerRegisterFontsForURL(NunitoBoldPath, .process, nil)
CTFontManagerRegisterFontsForURL(NunitoLightPath, .process, nil)
CTFontManagerRegisterFontsForURL(NunitoItalicPath, .process, nil)

// MARK: - Display a live preview of the playground
let liveView = Home(frame: RoboView.frame)
PlaygroundPage.current.liveView = liveView
