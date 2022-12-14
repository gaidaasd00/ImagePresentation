//
//  CircularLoaderView.swift
//  ImagePresentation
//
//  Created by Alexey Gaidykov on 13.12.2022.
//

import UIKit

final class CircularLoaderView: UIView {
    private let circularPatLayer = CAShapeLayer()
    private let circularRadius: CGFloat = 20
    
    var progress: CGFloat {
        get {
            circularPatLayer.strokeEnd
        }
        set {
            if newValue > 1 {
                circularPatLayer.strokeEnd = 1
            } else if  newValue < 0 {
                circularPatLayer.strokeEnd = 0
            } else {
                circularPatLayer.strokeEnd = newValue
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circularPatLayer.frame = bounds
        circularPatLayer.path = circulaPath().cgPath
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        progress = 0
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        circularPatLayer.frame = bounds
        circularPatLayer.lineWidth = 10
        circularPatLayer.fillColor = UIColor.clear.cgColor
        circularPatLayer.strokeColor = UIColor.green.cgColor
        layer.addSublayer(circularPatLayer)
    }
    
    //создание квадрата
    func circularFrame() -> CGRect {
        var circularFrame = CGRect(
            x: 0,
            y: 0,
            width: 2 * circularRadius,
            height: 2 * circularRadius
        )
        let circularPatBounds = circularPatLayer.bounds
        circularFrame.origin.x = circularPatBounds.midX - circularFrame.midX
        circularFrame.origin.y = circularPatBounds.midY - circularPatBounds.midY
        return circularFrame
    }
    //вписание круга в квадрат
    func circulaPath() -> UIBezierPath {
        UIBezierPath(ovalIn: circularFrame())
    }
    func reveal() {
        backgroundColor = .clear
        progress = 1
        circularPatLayer.removeAnimation(forKey: "strokeEnd")
        circularPatLayer.removeFromSuperlayer()
        superview?.layer.mask = circularPatLayer
    }
}
