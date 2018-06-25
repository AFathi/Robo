import UIKit
import CoreGraphics

public struct RoboChar {
    public var char:UIImageView!
    fileprivate var frame:CGRect!
    fileprivate var faceParts:[UIImageView] = []
    fileprivate var facePart:UIImageView {
        let view = UIImageView(frame:CGRect(x:0, y:0, width:self.frame.size.width*0.25, height:self.frame.size.height*0.08))
        view.image = UIImage(named: "Robo/content.png")
        view.contentMode = .scaleAspectFit
        return view
    }
    
    public init(frame:CGRect) {
        self.frame = frame
        char = UIImageView(frame:self.frame)
        char.image = UIImage(named: "Robo/body.png")
        char.contentMode = .scaleAspectFit
        char.center = CGPoint(x:RoboView.frame.size.width/2 , y: RoboView.frame.size.height/2)
    }
    
    public func add(to view:UIView) {
        guard let char = self.char else {
            #if DEBUG
                print("ERROR @ \(Date().timeIntervalSince1970):- Cannot add RoboChar without initializing.")
            #endif
            return
        }
        view.addSubview(char)
    }
    
    public mutating func animate(count:Float, fade:Bool) {
        guard let char = self.char else {
            #if DEBUG
                print("ERROR @ \(Date().timeIntervalSince1970):- Cannot animate RoboChar without initializing.")
            #endif
            return
        }
        
        let _ = faceParts.map { eye in
            eye.removeFromSuperview()
        }
        faceParts = []
        
        var yPos = char.bounds.height*0.32
        var duration = 0.9
        
        for i in 0 ..< 8 {
            // MARK: - Adding Character parts
            let eyeNode = facePart
            if i < 4 {
                // left eye parts
                eyeNode.center = CGPoint(x: char.bounds.width*0.35, y: yPos)
            }else{
                // right eye parts
                yPos = i == 4 ? char.bounds.height*0.32 : yPos
                eyeNode.center = CGPoint(x: char.bounds.width*0.65, y: yPos)
            }
            faceParts.append(eyeNode)
            char.addSubview(eyeNode)
            yPos += eyeNode.bounds.height*0.75
            
            // MARK:- Character Animation
            let yVal = faceParts[i].layer.position.y
            let bounceEyeParts = CASpringAnimation(keyPath: "position.y")
            bounceEyeParts.fromValue = yVal
            bounceEyeParts.toValue = yVal*1.2
            bounceEyeParts.duration = duration
            bounceEyeParts.damping = 25
            bounceEyeParts.stiffness = 150
            bounceEyeParts.repeatCount = count
            bounceEyeParts.autoreverses = true
            bounceEyeParts.fillMode = kCAFillModeBoth
            bounceEyeParts.isRemovedOnCompletion = false
            
            
            if fade {
                let fadeEyeParts = CABasicAnimation(keyPath: "opacity")
                fadeEyeParts.fromValue = 1
                fadeEyeParts.toValue = 0
                fadeEyeParts.duration = bounceEyeParts.beginTime + bounceEyeParts.duration*Double(count)
                fadeEyeParts.fillMode = kCAFillModeBoth
                fadeEyeParts.isRemovedOnCompletion = false
                let group = CAAnimationGroup()
                group.duration = bounceEyeParts.duration + fadeEyeParts.duration
                group.fillMode = kCAFillModeBoth
                group.isRemovedOnCompletion = false
                group.animations = [bounceEyeParts, fadeEyeParts]
                faceParts[i].layer.add(group, forKey: "bounceFadeEye")
            }else{
                faceParts[i].layer.add(bounceEyeParts, forKey: "bounceEye")
            }
            
            duration -= 0.08
        }
    }
}
