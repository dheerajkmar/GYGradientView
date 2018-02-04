//
//  GYGradientView.swift
//  GYGradientView
//
//  Created by Yhondri  on 3/2/18.
//  Copyright © 2018 Yhondri . All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable open class GYGradientView: UIView {
    
    @IBInspectable open var startColor: UIColor = .red {
        didSet {
            configureView()
        }
    }
    
    @IBInspectable open var endColor: UIColor = .yellow {
        didSet {
            configureView()
        }
    }
    
    @IBInspectable open var angle: Int = 0 {
        didSet {
            configureView()
        }
    }
    
    override open class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    func configureView() {
        
        guard let layer =  self.layer as? CAGradientLayer else {
            return
        }
        
        let startRadians = CGFloat(angle) * .pi / 180
        
        let startX = 0.5 + 0.5 * cos(startRadians)
        let startY = 0.5 + 0.5 * sin(startRadians)
        
        let endX = 1 - startX
        let endY = 1 - startY
        
        layer.startPoint = CGPoint(x: startX, y: startY)
        layer.endPoint = CGPoint(x: endX, y: endY)
        
        let colors: [CGColor] = [startColor.cgColor, endColor.cgColor]
        layer.colors = colors
        
        self.setNeedsDisplay()
    }
}

