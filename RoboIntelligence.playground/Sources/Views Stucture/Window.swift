import UIKit
import CoreGraphics

public class Window: UIView {
    fileprivate var allViews:[Window] = []
    fileprivate var isAnimationEnabled = true
    
    public func viewWillShow() {}
    public func present(_ view: Window, animated: Bool=true) {
        view.viewWillShow()
        view.alpha = 0
        view.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
        self.addSubview(view)
        if self.allViews.count == 0 {
            view.allViews.append(self)
        }
        view.allViews.append(contentsOf: self.allViews)
        
        if animated {
            UIView.animate(withDuration: 0.3) {
                view.alpha = 1
            }
        }else{
            view.isAnimationEnabled = animated
            view.alpha = 1
        }
    }
    
    public func dismiss() {
        if self.allViews.count != 0 {
            if self.isAnimationEnabled {
                UIView.animate(withDuration: 0.3, animations: {
                    self.alpha = 0
                }) { finished in
                    if finished {
                        self.allViews.removeLast()
                        self.removeFromSuperview()
                    }
                }
            }else{
                self.allViews.removeLast()
                self.removeFromSuperview()
            }
        }else{
            #if DEBUG
                print("WARNING @ \(Date().timeIntervalSince1970):- Cannot dismiss main view.")
            #endif
        }
    }
}

public struct RoboView {
    // iPad frame size (0.75x) - i.e. 75% of (1x iPad frame size)
    public static var frame:CGRect = CGRect(x: 0, y: 0, width: 768, height: 576)
}
