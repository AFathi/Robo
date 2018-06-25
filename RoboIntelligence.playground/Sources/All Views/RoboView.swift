import UIKit

public class Robo: Window {
    public var title:UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: RoboView.frame.size.width*0.85, height: RoboView.frame.size.height*0.34))
        lbl.center = CGPoint(x: RoboView.frame.size.width/2, y: RoboView.frame.size.height*0.12)
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        lbl.font = UIFont(name: "Nunito-Bold", size: 60)
        lbl.textColor = UIColor(red: 241/255, green: 103/255, blue: 103/255, alpha: 1.0)
        return lbl
    }()
    
    var backButton:UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 75, height: 75))
        btn.center = CGPoint(x: btn.bounds.width/2, y: btn.bounds.height/2)
        btn.setTitle("X", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Nunito-Bold", size: 45)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    var descriptionLabel:UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: RoboView.frame.size.width*0.85, height: RoboView.frame.size.height*0.37))
        lbl.center = CGPoint(x: RoboView.frame.size.width/2, y: RoboView.frame.size.height*0.27)
        lbl.numberOfLines = 6
        return lbl
    }()
    
    var startLabel:UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: (RoboView.frame.size.width*0.4)*0.6, height: (RoboView.frame.size.width*0.4)*0.4))
        lbl.textAlignment = .center
        lbl.text = "start teaching"
        lbl.numberOfLines = 2
        lbl.font = UIFont(name: "GtekTechnology", size: 22)
        lbl.textColor = UIColor(red: 25/255, green: 176/255, blue: 229/255, alpha: 1.0)
        
        let fadeStartLabel = CABasicAnimation(keyPath: "opacity")
        fadeStartLabel.fromValue = 1
        fadeStartLabel.toValue = 0.4
        fadeStartLabel.duration = 1.4
        fadeStartLabel.repeatCount = .infinity
        fadeStartLabel.autoreverses = true
        
        lbl.layer.add(fadeStartLabel, forKey: nil)
        return lbl
    }()
    
    var overlayButton:UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: (RoboView.frame.size.width*0.4), height: (RoboView.frame.size.width*0.4)))
        btn.center = CGPoint(x: RoboView.frame.size.width/2, y: RoboView.frame.size.height*0.65)
        btn.setImage(UIImage(named:"Robo/overlay.png"), for: .normal)
        return btn
    }()
    
    var appleEmitterLayer:CAEmitterLayer = {
        let appleEmitter = CAEmitterLayer()
        appleEmitter.emitterPosition = CGPoint(x: RoboView.frame.size.width*0.62, y: RoboView.frame.size.height*0.35)
        appleEmitter.emitterCells = []
        
        for i in 0 ..< 7 {
            let cell = CAEmitterCell()
            cell.birthRate = 0.8
            cell.lifetime = 3.6
            cell.velocity = 60
            cell.scale = 0.3
            cell.emissionRange = CGFloat.pi*0.28
            cell.emissionLongitude = CGFloat.pi*0.68
            cell.contents = UIImage(named: "Data/Training Samples/apple_0\(i).jpg")!.cgImage
            appleEmitter.emitterCells?.append(cell)
        }
        
        return appleEmitter
    }()
    
    var bananaEmitterLayer:CAEmitterLayer = {
        let bananaEmitter = CAEmitterLayer()
        bananaEmitter.emitterPosition = CGPoint(x: RoboView.frame.size.width*0.82, y: RoboView.frame.size.height*0.35)
        bananaEmitter.emitterCells = []
        for i in 0 ..< 7 {
            let cell = CAEmitterCell()
            cell.birthRate = 0.8
            cell.lifetime = 5
            cell.velocity = 60
            cell.scale = 0.3
            cell.emissionRange = CGFloat.pi*0.18
            cell.emissionLongitude = CGFloat.pi*0.8
            cell.contents = UIImage(named: "Data/Training Samples/banana_0\(i).jpg")!.cgImage
            bananaEmitter.emitterCells?.append(cell)
        }
        
        return bananaEmitter
    }()
    
    var mathEmitterLayer:CAEmitterLayer = {
        let mathEmitter = CAEmitterLayer()
        mathEmitter.emitterPosition = CGPoint(x: RoboView.frame.size.width*0.56, y: RoboView.frame.size.height*0.35)
        mathEmitter.emitterCells = []
        
        for i in 0 ..< 2 {
            let cell = CAEmitterCell()
            cell.birthRate = 0.8
            cell.lifetime = 2.5
            cell.velocity = 60
            cell.scale = 0.7
            cell.emissionRange = CGFloat.pi*0.28
            cell.emissionLongitude = CGFloat.pi*0.68
            cell.contents = UIImage(named: "Data/Training Samples/math_0\(i).png")!.cgImage
            mathEmitter.emitterCells?.append(cell)
        }
        
        return mathEmitter
    }()
    
    var bioEmitterLayer:CAEmitterLayer = {
        let bioEmitter = CAEmitterLayer()
        bioEmitter.emitterPosition = CGPoint(x: RoboView.frame.size.width*0.68, y: RoboView.frame.size.height*0.35)
        bioEmitter.emitterCells = []
        for i in 0 ..< 2 {
            let cell = CAEmitterCell()
            cell.birthRate = 0.8
            cell.lifetime = 3.5
            cell.velocity = 60
            cell.scale = 0.7
            cell.emissionRange = CGFloat.pi*0.18
            cell.emissionLongitude = CGFloat.pi*0.8
            cell.contents = UIImage(named: "Data/Training Samples/bio_0\(i).png")!.cgImage
            bioEmitter.emitterCells?.append(cell)
        }
        
        return bioEmitter
    }()
    
    var nextButton:UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 175, height: 75))
        btn.center = CGPoint(x: RoboView.frame.size.width*0.9, y: RoboView.frame.size.height*0.95)
        btn.setTitle("NEXT >", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Nunito-Italic", size: 30)
        btn.layer.shadowColor = UIColor(red: 241/255, green: 103/255, blue: 103/255, alpha: 1.0).cgColor
        btn.layer.shadowOffset = CGSize(width: 2, height: 1)
        btn.layer.shadowOpacity = 0.6
        btn.setTitleColor(UIColor(red: 239/255, green: 104/255, blue: 106/255, alpha: 1.0), for: .normal)
        btn.setTitleColor(UIColor(red: 239/255, green: 104/255, blue: 106/255, alpha: 0.2), for: .highlighted)
        return btn
    }()
    
    var selectHelpText:UILabel =  {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 180))
        lbl.center = CGPoint(x: RoboView.frame.size.width*0.85, y: RoboView.frame.size.height*0.96)
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red: 241/255, green: 103/255, blue: 103/255, alpha: 1.0)
        lbl.text = "[ select a fruit for Robo to predict ]"
        lbl.font = UIFont(name: "Nunito-Italic", size: 14)
        lbl.layer.shadowColor = UIColor(red: 241/255, green: 103/255, blue: 103/255, alpha: 1.0).cgColor
        lbl.layer.shadowOffset = CGSize(width: 2, height: 1)
        lbl.layer.shadowOpacity = 0.6
        return lbl
    }()
    
    var testData:UIButton {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 65, height: 65))
        btn.center = CGPoint(x: RoboView.frame.size.width*0.80, y: RoboView.frame.size.height*0.45)
        btn.layer.cornerRadius = btn.bounds.width*0.08
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(testRobo(_:)), for: .touchUpInside)
        return btn
    }
    
    var infoLabel:UILabel {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: RoboView.frame.size.width*0.85, height: RoboView.frame.size.height*0.06))
        lbl.font = UIFont(name: "Nunito-Light", size: 16)!
        lbl.center = CGPoint(x: RoboView.frame.size.width/2, y: RoboView.frame.size.height*0.56)
        return lbl
    }
    
    var demoImage:UIImageView {
        let img = UIImageView(frame: CGRect(x: 0, y: 0, width: RoboView.frame.size.width*0.85, height: RoboView.frame.size.height*0.08))
        img.center = CGPoint(x: RoboView.frame.size.width/2, y: RoboView.frame.size.height*0.62)
        img.contentMode = .scaleAspectFit
        return img
    }
    
    var subtitles:[String:[String]] = [
        "Vision":
            ["In this part, we will teach Robo the ability to ‘see’ and distinguish whether an image contains Apples or Bananas.",
             
             "In order to teach Robo to distinguish whether an image contains Apples or Bananas, every image had a tag that tells Robo which fruit each image contains.\n\nAfter Robo receives a tagged image, it does the following:",
             
             "It’s time to test Robo on its ability to distinguish whether an image contains Apples or Bananas!"],
        
        "Language Understanding":
            ["In this part, we will teach Robo the ability to distinguish whether a piece of text is from a Math or Biology book.",
             "In order to teach Robo to distinguish whether a piece of text is from a Math or Biology book, every text had a tag that tells Robo which topic each text appears in.\n\nAfter Robo receives a tagged text, it does the following:",
             "It’s time to test Robo on its ability to distinguish whether a piece of text is from a Math or Biology book!"
        ]]
    
    public var robo = RoboChar(frame: CGRect(x:0, y:0, width:RoboView.frame.size.width*0.4, height:RoboView.frame.size.width*0.4))
    
    let testTextData = ["find the value of x", "types of cells in living organisms", "what are lipids", "find the rate of change of √x", "plants are living organisms", "the area of a triangle", "what is the average speed", "what does a cell structure look like"]

    public override func viewWillShow() {
        self.addSubview(self.title)
        self.addSubview(self.backButton)
        
        guard let title = title.text else{return}
        
        self.prepare(view:title)
        self.robo.add(to: self)
        self.robo.char.center.y = RoboView.frame.size.height*0.65
        self.robo.char.addSubview(self.startLabel)
        self.addSubview(self.overlayButton)
        
        
        self.startLabel.center = CGPoint(x:self.robo.char.bounds.width/2, y:self.robo.char.bounds.height/2)
        
        self.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        self.overlayButton.addTarget(self, action: #selector(teachRobo), for: .touchUpInside)
        self.nextButton.addTarget(self, action: #selector(goToTest), for: .touchUpInside)
        
        self.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
    }
    
    func prepare(view name:String) {
        guard let subtitle = subtitles[name]?[0] else{return}
        let descriptionText =  NSMutableAttributedString(string: subtitle, attributes: [.font: UIFont(name: "Nunito-Light", size: 24)!])
        if name == "Vision" {
            descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 24)!, .foregroundColor: UIColor(red: 24/255, green: 207/255, blue: 97/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "teach")!, in: descriptionText.string))
            descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 24)!], range: NSRange(descriptionText.string.range(of: "Robo")!, in: descriptionText.string))
            descriptionText.addAttributes([.foregroundColor: UIColor(red: 195/255, green: 35/255, blue: 9/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Apples")!, in: descriptionText.string))
            descriptionText.addAttributes([.foregroundColor: UIColor(red: 223/255, green: 190/255, blue: 100/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Bananas")!, in: descriptionText.string))
        }else if name == "Language Understanding" {
            self.title.font = UIFont(name: "Nunito-Bold", size: 50)
            descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 24)!, .foregroundColor: UIColor(red: 24/255, green: 207/255, blue: 97/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "teach")!, in: descriptionText.string))
            descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 24)!], range: NSRange(descriptionText.string.range(of: "Robo")!, in: descriptionText.string))
            descriptionText.addAttributes([.foregroundColor: UIColor(red: 192/255, green: 51/255, blue: 213/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Math")!, in: descriptionText.string))
            descriptionText.addAttributes([.foregroundColor: UIColor(red: 13/255, green: 195/255, blue: 180/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Biology")!, in: descriptionText.string))
        }
        self.descriptionLabel.attributedText = descriptionText
        self.addSubview(self.descriptionLabel)
    }
    
    @objc func goBack() {
        self.dismiss()
    }
    
    @objc func teachRobo() {
        guard let title = title.text else{return}
        if title == "Vision" {
            self.startLabel.removeFromSuperview()
            self.overlayButton.alpha = 0
            self.layer.insertSublayer(appleEmitterLayer, at: 0)
            self.robo.animate(count: 7, fade: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                self.appleEmitterLayer.removeFromSuperlayer()
                self.startLabel.text = "🍎 👍"
                self.robo.char.addSubview(self.startLabel)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    self.startLabel.text = ""
                    self.layer.insertSublayer(self.bananaEmitterLayer, at: 0)
                    self.robo.animate(count: 7, fade: true)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        self.bananaEmitterLayer.removeFromSuperlayer()
                        self.startLabel.text = "🍌 👍"
                        self.goToStep(num:1)
                    }
                }
            }
        }else if title == "Language Understanding" {
            self.startLabel.removeFromSuperview()
            self.overlayButton.alpha = 0
            self.layer.insertSublayer(mathEmitterLayer, at: 0)
            self.robo.animate(count: 7, fade: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                self.mathEmitterLayer.removeFromSuperlayer()
                self.startLabel.text = "✖️➗ 👍"
                self.robo.char.addSubview(self.startLabel)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    self.startLabel.text = ""
                    self.layer.insertSublayer(self.bioEmitterLayer, at: 0)
                    self.robo.animate(count: 7, fade: true)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                        self.bioEmitterLayer.removeFromSuperlayer()
                        self.startLabel.text = "🔬 👍"
                        self.goToStep(num:1)
                    }
                }
            }
        }
    }
    
    @objc func goToTest() {
        guard let title = title.text else{return}
        if title == "Vision" {
            self.startLabel.text = "test me"
            self.goToStep(num:2)
        }else if title == "Language Understanding" {
            self.startLabel.text = "test me"
            self.goToStep(num:2)
        }
    }
    
    @objc func testRobo(_ sender:UIButton) {
        guard let name = title.text else{return}
        if name == "Vision" {
            if let img = sender.currentBackgroundImage {
                let result = self.classify(image: img)
                self.startLabel.text = result.lowercased()
            }
        }else if name == "Language Understanding" {
            if let text = sender.titleLabel?.text {
                let result = self.classify(text: text)
                self.startLabel.text = result.lowercased()
            }
        }
    }
    
    fileprivate var stepsViews:[UIView] = []
    func goToStep(num:Int) {
        guard let name = title.text else{return}
        guard let subtitle = subtitles[name]?[num] else{return}
        let step1Lbl = infoLabel
        let step1img = demoImage
        let step2Lbl = infoLabel
        let step2img = demoImage
        let step3Lbl = infoLabel
        let factLbl = infoLabel
        
        let descriptionText = NSMutableAttributedString(string: subtitle, attributes: [.font: UIFont(name: "Nunito-Light", size: 24)!])
        if name == "Vision" {
            if num == 1 {
                descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 24)!, .foregroundColor: UIColor(red: 24/255, green: 207/255, blue: 97/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "teach")!, in: descriptionText.string))
                descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 24)!], range: NSRange(descriptionText.string.range(of: "Robo")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 195/255, green: 35/255, blue: 9/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Apples")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 223/255, green: 190/255, blue: 100/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Bananas")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 35/255, green: 123/255, blue: 213/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "tag")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 35/255, green: 123/255, blue: 213/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "tagged")!, in: descriptionText.string))
                
                step1img.image = UIImage(named:"Icons/visionExtract.png")!
                step2img.image = UIImage(named:"Icons/visionDefinition.png")!
                
                step1Lbl.text = "1. Extracts unique features from each given image."
                step2Lbl.text = "2. Analyzes the extracted features to use them as definitions for each fruit type."
                step3Lbl.text = "3. Repeats step 1 and 2 with all given images."
                factLbl.text = "FUN FACT:- The more diverse images Robo receives, the more accurate results will be."
                
                step2Lbl.center.y += step2Lbl.bounds.height*2.3
                step3Lbl.center.y += step3Lbl.bounds.height*4.55
                factLbl.center.y += factLbl.bounds.height*5.45
                step2img.center.y += step2img.bounds.height*1.8
                
                stepsViews.append(contentsOf:[step1Lbl, step2Lbl, step3Lbl, factLbl, step1img, step2img])
                
                UIView.animate(withDuration: 0.8) {
                    self.robo.char.center.y += RoboView.frame.size.height+self.robo.char.bounds.height
                    self.descriptionLabel.attributedText = descriptionText
                    self.descriptionLabel.center.y += self.descriptionLabel.bounds.height*0.25
                }
                
                for view in stepsViews {
                    self.addSubview(view)
                }
                self.addSubview(self.nextButton)
            }else if num == 2 {
                descriptionText.addAttributes([.font: UIFont(name: "Nunito-Italic", size: 24)!], range: NSRange(descriptionText.string.range(of: "test")!, in: descriptionText.string))
                descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 24)!], range: NSRange(descriptionText.string.range(of: "Robo")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 195/255, green: 35/255, blue: 9/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Apples")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 223/255, green: 190/255, blue: 100/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Bananas")!, in: descriptionText.string))
                
                for view in stepsViews {
                    view.removeFromSuperview()
                }
                self.overlayButton.isUserInteractionEnabled = false
                UIView.animate(withDuration: 0.8, animations: {
                    self.nextButton.alpha = 0
                    self.robo.char.center.y -= RoboView.frame.size.height+self.robo.char.bounds.height
                    self.descriptionLabel.attributedText = descriptionText
                    self.descriptionLabel.center.y -= self.descriptionLabel.bounds.height*0.25
                }){ finished in
                    if finished {
                        self.overlayButton.alpha = 1
                    }
                }
                
                var yPos = self.testData.center.y
                for i in 0 ..< 8 {
                    let btn = self.testData
                    btn.setBackgroundImage(UIImage(named:"Data/Test Images/img_0\(i).png"), for: .normal)
                    if i < 4 {
                        btn.center.y = yPos
                        yPos += btn.bounds.height+10
                        if i == 3 {
                            yPos = self.testData.center.y
                        }
                    }else{
                        btn.center = CGPoint(x: RoboView.frame.size.width*0.92, y: yPos)
                        yPos += btn.bounds.height+10
                    }
                    self.addSubview(btn)
                }
                self.addSubview(selectHelpText)
            }
        }else if name == "Language Understanding" {
            if num == 1 {
                descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 24)!, .foregroundColor: UIColor(red: 24/255, green: 207/255, blue: 97/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "teach")!, in: descriptionText.string))
                descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 24)!], range: NSRange(descriptionText.string.range(of: "Robo")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 192/255, green: 51/255, blue: 213/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Math")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 13/255, green: 195/255, blue: 180/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Biology")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 35/255, green: 123/255, blue: 213/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "tag")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 35/255, green: 123/255, blue: 213/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "tagged")!, in: descriptionText.string))
                
                step1img.image = UIImage(named:"Icons/nlpExtract.png")!
                step2img.image = UIImage(named:"Icons/nlpDefinition.png")!
                
                step1Lbl.text = "1. Extracts words from each given piece of text."
                step2Lbl.text = "2. Counts how many times a word appear in each topic to use them as definitions."
                step3Lbl.text = "3. Repeats step 1 and 2 with all given text."
                
                step2Lbl.center.y += step2Lbl.bounds.height*2.3
                step3Lbl.center.y += step3Lbl.bounds.height*4.55
                step2img.center.y += step2img.bounds.height*1.8
                
                stepsViews.append(contentsOf:[step1Lbl, step2Lbl, step3Lbl, factLbl, step1img, step2img])

                UIView.animate(withDuration: 0.8) {
                    self.robo.char.center.y += RoboView.frame.size.height+self.robo.char.bounds.height
                    self.descriptionLabel.attributedText = descriptionText
                    self.descriptionLabel.center.y += self.descriptionLabel.bounds.height*0.25
                }
                
                for view in stepsViews {
                    self.addSubview(view)
                }
                self.addSubview(self.nextButton)
            }else if num == 2 {
                descriptionText.addAttributes([.font: UIFont(name: "Nunito-Italic", size: 24)!], range: NSRange(descriptionText.string.range(of: "test")!, in: descriptionText.string))
                descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 24)!], range: NSRange(descriptionText.string.range(of: "Robo")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 192/255, green: 51/255, blue: 213/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Math")!, in: descriptionText.string))
                descriptionText.addAttributes([.foregroundColor: UIColor(red: 13/255, green: 195/255, blue: 180/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "Biology")!, in: descriptionText.string))
                
                for view in stepsViews {
                    view.removeFromSuperview()
                }
                self.overlayButton.isUserInteractionEnabled = false
                UIView.animate(withDuration: 0.8, animations: {
                    self.nextButton.alpha = 0
                    self.robo.char.center.y -= RoboView.frame.size.height+self.robo.char.bounds.height
                    self.descriptionLabel.attributedText = descriptionText
                    self.descriptionLabel.center.y -= self.descriptionLabel.bounds.height*0.25
                }){ finished in
                    if finished {
                        self.overlayButton.alpha = 1
                    }
                }
                
                var yPos = self.testData.center.y
                for (i, text) in testTextData.enumerated() {
                    let btn = self.testData
                    btn.setTitle(text, for: .normal)
                    btn.setTitleColor(.black, for: .normal)
                    btn.setTitleColor(.gray, for: .highlighted)
                    btn.titleLabel?.font = UIFont(name: "Nunito-Light", size: 11)!
                    btn.titleLabel?.numberOfLines = 3
                    btn.titleLabel?.textAlignment = .center
                    btn.backgroundColor = .white
                    if i < 4 {
                        btn.center.y = yPos
                        yPos += btn.bounds.height+10
                        if i == 3 {
                            yPos = self.testData.center.y
                        }
                    }else{
                        btn.center = CGPoint(x: RoboView.frame.size.width*0.92, y: yPos)
                        yPos += btn.bounds.height+10
                    }
                    self.addSubview(btn)
                }
                self.selectHelpText.text = "[ select a text for Robo to predict ]"
                self.addSubview(selectHelpText)
            }
        }
        
    }
    
    
    // MARK: - Fruit Type CoreML Classifier
    public func classify(image: UIImage) -> String {
        let classifier = AppleBananaClassifier()
        if let buffer = image.buffer {
            guard let prediction = try? classifier.prediction(image: buffer) else {return "😭"}
            return prediction.fruitType
        }else{
            return "😭"
        }
    }
    
    // MARK: - Text Type Naive Bayes Classifier
    public func classify(text: String) -> String {
        let classifier = MathBioClassifier()
        guard let prediction = classifier.predict(text) else {return "😭"}
        return prediction
    }
}


public extension UIImage {
    public var buffer: CVPixelBuffer? {
        if let image = self.cgImage {
            let frameSize = self.size
            var pixelBuffer:CVPixelBuffer? = nil
            let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(frameSize.width), Int(frameSize.height), kCVPixelFormatType_32BGRA , nil, &pixelBuffer)
            if status != kCVReturnSuccess {
                return nil
            }
            CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags.init(rawValue: 0))
            let data = CVPixelBufferGetBaseAddress(pixelBuffer!)
            let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
            let bitmapInfo = CGBitmapInfo(rawValue: CGBitmapInfo.byteOrder32Little.rawValue | CGImageAlphaInfo.premultipliedFirst.rawValue)
            let context = CGContext(data: data, width: Int(frameSize.width), height: Int(frameSize.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo: bitmapInfo.rawValue)
            context?.draw(image, in: CGRect(x: 0, y: 0, width: image.width, height: image.height))
            CVPixelBufferUnlockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
            
            return pixelBuffer
        }else{
            return nil
        }
    }
}
