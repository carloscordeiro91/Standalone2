//
//  ViewController.swift
//  Standalone2
//
//  Created by itsector on 04/03/2020.
//  Copyright © 2020 itsector. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let practiceLayer: CALayer = CALayer()
    
    let practiceView: UIView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(practiceView)
        
        practiceView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
       // practiceView.layer.addSublayer(practiceLayer)
        
       // practiceLayer.backgroundColor = UIColor.red.cgColor
        
        let viewTap = UIGestureRecognizer(target: self, action: #selector(practiceAnimComplete))
        
        practiceView.addGestureRecognizer(viewTap)
        
        practiceView.isUserInteractionEnabled = true
        
        practiceView.backgroundColor = UIColor.red
        
        practiceView.alpha = 0.2
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
       // practiceLayer.frame = practiceView.bounds
        
        
    }
    
    @objc func practiceDuration() {
        
        CATransaction.begin()
        
        CATransaction.setAnimationDuration(2)
        
        practiceLayer.position = CGPoint(x: 300, y: 300)
        
        practiceLayer.backgroundColor = UIColor.orange.cgColor
        
        CATransaction.commit()
        
    }
    
    @objc func practiceTimingFunctionAnim() {
        
        let timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        
        CATransaction.begin()
        
        CATransaction.setAnimationTimingFunction(timingFunction)
        
        practiceLayer.position = CGPoint(x: 300, y: 300)
        
        practiceLayer.backgroundColor = UIColor.orange.cgColor
        
        CATransaction.commit()
        
    }
    
    
    @objc func practiceDisableAnim() {
        
        CATransaction.begin()
        
        CATransaction.setDisableActions(true)
        
        UIView.animate(withDuration: 1.0) {
            self.practiceView.alpha = 0.0
        }
        
        CATransaction.commit()
        
    }
    
    @objc func practiceAnimComplete() {
        
        CATransaction.begin()
        
        CATransaction.setCompletionBlock {
            
            self.practiceView.layer.position.x = 250
            
        
        }
        
        UIView.animate(withDuration: 1.0) {
            self.practiceView.alpha = 1.0
        }
        
        let basicAnimation = CABasicAnimation(keyPath: "position.x")
        
        basicAnimation.duration = 2.0
        
        basicAnimation.fromValue = practiceView.layer.position
        
        basicAnimation.toValue = 250
        
        practiceView.layer.add(basicAnimation, forKey: nil)
        
        CATransaction.commit()
    }


}

