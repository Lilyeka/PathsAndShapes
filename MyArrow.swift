//
//  MyArrow.swift
//  PathsAndShapes
//
//  Created by Лилия Левина on 30/04/2019.
//  Copyright © 2019 Лилия Левина. All rights reserved.
//

import UIKit

class MyArrow: UIView {
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        self.isOpaque = false // for delete black background colour
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func draw(_ rect: CGRect) {
        //drawWithUIKitAndFillClear()
        drawWithUIKitAndClip()
        //drawWithCGAndBlendMode()
        //drawWithCGAndClipping()
    }
    
    // Drawing with Core Graphics
    func drawWithCGAndBlendMode() {
        let con = UIGraphicsGetCurrentContext()!
        con.move(to: CGPoint(x: 100, y: 100))
        con.addLine(to: CGPoint(x: 100, y: 19))
        con.setLineWidth(20)
        con.strokePath()

        con.setFillColor(UIColor.cyan.cgColor)
        con.move(to: CGPoint(x: 80, y: 25))
        con.addLine(to: CGPoint(x: 100, y: 0))
        con.addLine(to: CGPoint(x: 120, y: 25))
        con.fillPath()

        // “punch out” the triangular notch in the tail of the arrow
        // using blend mode
        con.move(to: CGPoint(x: 90, y: 101))
        con.addLine(to: CGPoint(x: 100, y: 90))
        con.addLine(to: CGPoint(x: 110, y: 101))
        con.setBlendMode(.clear)
        con.fillPath()
    }
    
    func drawWithCGAndClipping() {
        // using clipping
        // This is a little tricky, because what we want to clip to is not the region inside the triangle but the region outside it. To express this, we’ll use a compound path consisting of more than one closed area — the triangle, and the drawing area as a whole (which we can obtain as the context’s boundingBoxOfClipPath).
        let con = UIGraphicsGetCurrentContext()!
        con.move(to: CGPoint(x: 90, y: 100))
        con.addLine(to: CGPoint(x: 100, y: 90))
        con.addLine(to: CGPoint(x: 110, y: 100))
        con.closePath()
        con.addRect(con.boundingBoxOfClipPath)
        con.clip(using: .evenOdd)
        
        con.move(to: CGPoint(x: 100, y: 100))
        con.addLine(to: CGPoint(x: 100, y: 19))
        con.setLineWidth(20)
        con.strokePath()
        
        con.setFillColor(UIColor.cyan.cgColor)
        con.move(to: CGPoint(x: 80, y: 25))
        con.addLine(to: CGPoint(x: 100, y: 0))
        con.addLine(to: CGPoint(x: 120, y: 25))
        con.fillPath()
    }
    
    //Drawing with UIKit
    func drawWithUIKitAndFillClear() {  //
        let p = UIBezierPath()
        p.move(to: CGPoint(x: 100, y: 100))
        p.addLine(to: CGPoint(x: 100, y: 19))
        p.lineWidth = 20
        p.stroke()
        
        UIColor.cyan.set()
        p.removeAllPoints()
        p.move(to: CGPoint(x: 80, y: 25))
        p.addLine(to: CGPoint(x: 100, y: 0))
        p.addLine(to: CGPoint(x: 120, y: 25))
        p.fill()
        
        // “punch out” the triangular notch in the tail of the arrow
        // using fill with clear colour
        p.removeAllPoints()
        p.move(to: CGPoint(x: 90, y: 101))
        p.addLine(to: CGPoint(x: 100, y: 90))
        p.addLine(to: CGPoint(x: 110, y: 101))
        p.fill(with: .clear, alpha: 1.0)
    }
    
    func drawWithUIKitAndClip() {
        let p = UIBezierPath(rect: UIGraphicsGetCurrentContext()!.boundingBoxOfClipPath)
        // using clipping
        // This is a little tricky, because what we want to clip to is not the region inside the triangle but the region outside it. To express this, we’ll use a compound path consisting of more than one closed area — the triangle, and the drawing area as a whole (which we can obtain as the context’s boundingBoxOfClipPath).
        p.move(to: CGPoint(x: 90, y: 100))
        p.addLine(to: CGPoint(x: 100, y: 90))
        p.addLine(to: CGPoint(x: 110, y: 100))
        p.close()
        p.usesEvenOddFillRule = true
        p.addClip()
    
        p.removeAllPoints()
        p.move(to: CGPoint(x: 100, y: 100))
        p.addLine(to: CGPoint(x: 100, y: 19))
        p.lineWidth = 20
        p.stroke()
        
        UIColor.cyan.set()
        p.removeAllPoints()
        p.move(to: CGPoint(x: 80, y: 25))
        p.addLine(to: CGPoint(x: 100, y: 0))
        p.addLine(to: CGPoint(x: 120, y: 25))
        p.fill()
    }
    
}
