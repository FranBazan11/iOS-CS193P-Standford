//: A UIKit based Playground for presenting user interface
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = myView()
        
        view.backgroundColor = .white
        
        
        
        let labelRect = CGRect(x: 20, y: 20, width: 100, height: 50)
        let label = UILabel(frame: labelRect) // UILabel is a subclass of UIView
        label.text = "Hello"
        view.addSubview(label)
        
       
        
        self.view = view
    }
}

class myView : UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: CGPoint(x: 80, y: 50))
        path.addLine(to: CGPoint(x: 140, y: 150))
        path.addLine(to: CGPoint(x: 20, y: 150))
        path.close()
        
        UIColor.green.setFill()
        UIColor.red.setStroke()
        path.lineWidth = 3.0
        path.fill()
        path.stroke()
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()

