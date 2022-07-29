//
//  ViewController.swift
//  Boardingpass_BP
//
//  Created by Chanti on 17/07/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        
        let myView = BoardingPassView()
        myView.frame = CGRect(x: 30, y: 80, width: 310, height: 700)
        myView.backgroundColor = UIColor.gray
        view.addSubview(myView)
        //self.view = view
    }


}

class BoardingPassView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        let path =  getPath()
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.lineWidth = 2.0
        shape.strokeColor = UIColor.gray.cgColor
        shape.fillColor = UIColor.white.cgColor
        
//        let gradient = CAGradientLayer()
//        gradient.frame = CGRect(x: path.bounds.origin.x,
//                                y: path.bounds.origin.y,
//                                width: path.bounds.width,
//                                height: path.bounds.height)
//        gradient.colors = [
//            UIColor.red.cgColor,
//            UIColor.blue.cgColor
//        ]
//
//        let shapeMask = CAShapeLayer()
//        shapeMask.path = path.cgPath
//        gradient.mask = shapeMask
        
        //self.layer.addSublayer(gradient)
        self.layer.addSublayer(shape)
    }
    
    func getPath() -> UIBezierPath {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 50, y: 10))
        
        //Top Edge
        path.addLine(to: CGPoint(x: 260, y: 10))
        
        //Right Top Curve
        path.addArc(withCenter: CGPoint(x: 260, y: 50),
                    radius: 40,
                    startAngle: CGFloat(Double.pi/2 * 3),
                    endAngle: 0,
                    clockwise: true)
        
        //Right Edge
        path.addLine(to: CGPoint(x: 300, y: 300))
        
        //Semicircle on right Edge
        path.addArc(withCenter: CGPoint(x: 300, y: 320),
                    radius: 14,
                    startAngle: CGFloat(Double.pi/2 * 3),
                    endAngle: CGFloat(Double.pi/2),
                    clockwise: false)
        
        //Right Edge Second Half
        path.addLine(to: CGPoint(x: 300, y: 450))
        
        //Right Bottom curve
        path.addArc(withCenter: CGPoint(x: 260, y: 450),
                    radius: 40,
                    startAngle: CGFloat(0),
                    endAngle: CGFloat(Double.pi/2),
                    clockwise: true)
        
        //Bottom Edge
        path.addLine(to: CGPoint(x: 50, y: 490))
        
        //Left Bottom curve
        path.addArc(withCenter: CGPoint(x: 50, y: 450),
                    radius: 40,
                    startAngle: CGFloat(Double.pi/2),
                    endAngle: CGFloat(Double.pi),
                    clockwise: true)
        
        //Left Second half
        path.addLine(to: CGPoint(x: 10, y: 340))
        
        //Semi circle on left edge
        path.addArc(withCenter: CGPoint(x: 10, y: 320),
                    radius: 14,
                    startAngle: CGFloat(Double.pi/2),
                    endAngle: CGFloat(Double.pi/2 * 3),
                    clockwise: false)
        
        //Left Edge
        path.addLine(to: CGPoint(x: 10, y: 50))
        
        //Left Top Curve
        path.addArc(withCenter: CGPoint(x: 50, y: 50),
                    radius: 40,
                    startAngle: CGFloat(Double.pi),
                    endAngle: CGFloat(Double.pi/2 * 3),
                    clockwise: true)
        
        //Moving to the semi circle
        path.move(to: CGPoint(x: 24, y: 320))
        
        //Line from left Semi circle to right
        path.addLine(to: CGPoint(x: 286, y: 320))
        
        path.close()
        
        return path
    }
}

