import UIKit

public class Home: Window {
    var title:UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: RoboView.frame.size.width*0.85, height: RoboView.frame.size.height*0.12))
        lbl.center = CGPoint(x: RoboView.frame.size.width/2, y: RoboView.frame.size.height*0.12)
        lbl.textAlignment = .center
        lbl.text = "Machine Intelligence"
        lbl.font = UIFont(name: "Nunito-Bold", size: 60)
        lbl.textColor = UIColor(red: 241/255, green: 103/255, blue: 103/255, alpha: 1.0)
        return lbl
    }()
    
    var tip:UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: RoboView.frame.size.width*0.95, height: RoboView.frame.size.height*0.08))
        lbl.center = CGPoint(x: RoboView.frame.size.width/2, y: RoboView.frame.size.height*0.92)
        lbl.textAlignment = .center
        lbl.text = "[ This playground interactively explains how machines learn ]"
        lbl.font = UIFont(name: "Nunito-Light", size: 26)
        lbl.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 0.8)
        return lbl
    }()
    
    var robo = RoboChar(frame: CGRect(x:0, y:0, width:RoboView.frame.size.width*0.4, height:RoboView.frame.size.width*0.4))
    
    var startLabel:UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: (RoboView.frame.size.width*0.4)*0.6, height: (RoboView.frame.size.width*0.4)*0.4))
        lbl.textAlignment = .center
        lbl.text = "hi i am robo!"
        lbl.numberOfLines = 2
        lbl.font = UIFont(name: "GtekTechnology", size: 22)
        lbl.textColor = UIColor(red: 25/255, green: 176/255, blue: 229/255, alpha: 1.0)
        return lbl
    }()
    
    var overlayButton:UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: (RoboView.frame.size.width*0.4), height: (RoboView.frame.size.width*0.4)))
        btn.center = CGPoint(x: RoboView.frame.size.width/2, y: RoboView.frame.size.height/2)
        btn.setImage(UIImage(named:"Robo/overlay.png"), for: .normal)
        btn.isUserInteractionEnabled = false
        return btn
    }()
    
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.viewWillShow()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK:- Prepare Home View
    public override func viewWillShow() {
        self.backgroundColor = UIColor(red: 241/255, green: 241/255, blue: 241/255, alpha: 1.0)
        
        self.addSubview(title)
        self.addSubview(tip)

        self.robo.add(to: self)
        self.robo.animate(count: 6, fade: true)
        
        self.startLabel.center = CGPoint(x:self.robo.char.bounds.width/2, y:self.robo.char.bounds.height/2)
        showStartLabel()
        
        self.addSubview(overlayButton)
        self.overlayButton.addTarget(self, action: #selector(goToInfo), for: .touchUpInside)
    }
    
    func showStartLabel() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
            let pulseStartLabel = CASpringAnimation(keyPath: "transform.scale")
            pulseStartLabel.fromValue = 1.0
            pulseStartLabel.toValue = 1.8
            pulseStartLabel.duration = 0.3
            pulseStartLabel.autoreverses = true
            
            let fadeStartLabel = CABasicAnimation(keyPath: "opacity")
            fadeStartLabel.fromValue = 1
            fadeStartLabel.toValue = 0.7
            fadeStartLabel.duration = 1.4
            fadeStartLabel.repeatCount = .infinity
            fadeStartLabel.autoreverses = true
            
            self.startLabel.layer.add(pulseStartLabel, forKey: nil)
            self.startLabel.layer.add(fadeStartLabel, forKey: nil)
            self.robo.char.addSubview(self.startLabel)
            self.overlayButton.isUserInteractionEnabled = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                self.startLabel.text = "tap to start"
            }
        }
    }
    
    @objc func goToInfo() {
        let infoView = Info(frame: RoboView.frame)
        self.present(infoView)
    }
    
}
