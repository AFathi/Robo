import UIKit

public class Info: Window {
    var title:UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: RoboView.frame.size.width*0.85, height: RoboView.frame.size.height*0.12))
        lbl.center = CGPoint(x: RoboView.frame.size.width/2, y: RoboView.frame.size.height*0.12)
        lbl.textAlignment = .center
        lbl.text = "Machine Intelligence?"
        lbl.font = UIFont(name: "Nunito-Bold", size: 60)
        lbl.textColor = UIColor(red: 241/255, green: 103/255, blue: 103/255, alpha: 1.0)
        return lbl
    }()
    
    var descriptionLabel:UILabel = {
        let descriptionText =  NSMutableAttributedString(string: "When machine intelligence was first founded, the main goal was to enable machines to perform any task a human can do.\n\nToday, the term “machine intelligence” is mainly used to describe technologies that require teaching to perform human-like tasks, such as:", attributes: [.font: UIFont(name: "Nunito-Light", size: 24)!])
        
        descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 24)!, .foregroundColor: UIColor(red: 24/255, green: 207/255, blue: 97/255, alpha: 1.0)], range: NSRange(descriptionText.string.range(of: "teaching")!, in: descriptionText.string))
        
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: RoboView.frame.size.width*0.85, height: RoboView.frame.size.height*0.37))
        lbl.center = CGPoint(x: RoboView.frame.size.width/2, y: RoboView.frame.size.height*0.38)
        lbl.numberOfLines = 6
        lbl.attributedText = descriptionText
        return lbl
    }()
    
    var andLabel:UILabel = {
        let descriptionText =  NSMutableAttributedString(string: "&\nselect an example to continue", attributes: [.font: UIFont(name: "Nunito-Bold", size: 110)!])
        
        descriptionText.addAttributes([.font: UIFont(name: "Nunito-Bold", size: 13)!], range: NSRange(descriptionText.string.range(of: "select an example to continue")!, in: descriptionText.string))
        
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 185, height: 180))
        lbl.center = CGPoint(x: RoboView.frame.size.width/2, y: RoboView.frame.size.height*0.82)
        lbl.numberOfLines = 3
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red: 198/255, green: 198/255, blue: 198/255, alpha: 1.0)
        lbl.attributedText = descriptionText
        return lbl
    }()
    
    var exampleTitle:UILabel {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 180))
        lbl.center = CGPoint(x: RoboView.frame.size.width*0.18, y: RoboView.frame.size.height*0.65)
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red: 241/255, green: 103/255, blue: 103/255, alpha: 1.0)
        lbl.font = UIFont(name: "Nunito-Bold", size: 24)
        lbl.layer.shadowColor = UIColor(red: 241/255, green: 103/255, blue: 103/255, alpha: 1.0).cgColor
        lbl.layer.shadowOffset = CGSize(width: 2, height: 1)
        lbl.layer.shadowOpacity = 0.6
        return lbl
    }
    
    var exampleButton:UIButton {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: (RoboView.frame.size.width*0.2), height: (RoboView.frame.size.width*0.2)))
        btn.center = CGPoint(x: RoboView.frame.size.width*0.18, y: RoboView.frame.size.height*0.8)
        btn.setImage(UIImage(named:"Icons/vision.png"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        
        let fadeButton = CASpringAnimation(keyPath: "opacity")
        fadeButton.fromValue = 0.7
        fadeButton.toValue = 1
        fadeButton.duration = 0.8
        fadeButton.repeatCount = .infinity
        fadeButton.autoreverses = true
        btn.layer.add(fadeButton, forKey: nil)
        return btn
    }
    
    var exampleDescription:UILabel {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 175, height: 180))
        lbl.center = CGPoint(x: RoboView.frame.size.width*0.18, y: RoboView.frame.size.height*0.92)
        lbl.textAlignment = .center
        lbl.textColor = UIColor(red: 241/255, green: 103/255, blue: 103/255, alpha: 1.0)
        lbl.font = UIFont(name: "Nunito-Light", size: 14)
        return lbl
    }
    
    public override func viewWillShow() {
        let vision = exampleTitle
        vision.text = "Vision"
        let visionBtn = exampleButton
        visionBtn.tag = 0
        visionBtn.addTarget(self, action: #selector(goToRobo(_:)), for: .touchUpInside)
        let visionDesc = exampleDescription
        visionDesc.text = "[ ability to see ]"
        
        let nlpDesc = exampleDescription
        nlpDesc.text = "[ ability to communicate ]"
        nlpDesc.center.x += RoboView.frame.size.width*0.60
        let nlpBtn = exampleButton
        nlpBtn.setImage(UIImage(named:"Icons/nlp.png"), for: .normal)
        nlpBtn.center.x += RoboView.frame.size.width*0.60
        nlpBtn.tag = 1
        nlpBtn.addTarget(self, action: #selector(goToRobo(_:)), for: .touchUpInside)

        let nlp = exampleTitle
        nlp.text = "Language Understanding"
        nlp.center.x += RoboView.frame.size.width*0.60
        
        self.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
        
        self.addSubview(vision)
        self.addSubview(visionBtn)
        self.addSubview(visionDesc)
        self.addSubview(nlp)
        self.addSubview(nlpBtn)
        self.addSubview(nlpDesc)
        self.addSubview(title)
        self.addSubview(descriptionLabel)
        self.addSubview(andLabel)
    }
    
    @objc func goToRobo(_ sender: UIButton) {
        let roboView = Robo(frame: RoboView.frame)
        roboView.title.text = sender.tag == 0 ? "Vision" : "Language Understanding"
        self.present(roboView)
    }
}
