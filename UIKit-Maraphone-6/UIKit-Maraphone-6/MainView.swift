import UIKit

final class MainView: UIView {
    private let cubeView = UIView()
    private var snap: UISnapBehavior!
    var animator: UIDynamicAnimator!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        animator = UIDynamicAnimator(referenceView: self)
        
        cubeView.backgroundColor = .blue
        cubeView.layer.cornerRadius = 10
        cubeView.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        addSubview(cubeView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            snap = UISnapBehavior(item: cubeView, snapTo: location)
            snap.damping = 0.9
            snap.snapPoint = location
            animator.addBehavior(snap)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.animator.removeAllBehaviors()
            }
        }
    }
}
