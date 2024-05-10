//
//  File.swift
//  CoinTrackerApp
//
//  Created by Ceren Uludoğan on 08.05.2024.
//

import Foundation
import UIKit

class ChartView: UIView {

    var sparklineData: [Double] = [] {
        didSet {
            setNeedsDisplay()
        }
    }

    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.setFillColor(UIColor.clear.cgColor)
        context.fill(rect)

        UIColor.blue.setStroke()
        context.setLineWidth(2.0)

        if sparklineData.count > 1 {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: yCoordinate(for: sparklineData[0], in: rect)))
            for i in 1..<sparklineData.count {
                let point = CGPoint(x: CGFloat(i) * rect.width / CGFloat(sparklineData.count - 1),
                                    y: yCoordinate(for: sparklineData[i], in: rect))
                path.addLine(to: point)
            }
            context.addPath(path.cgPath)
            context.strokePath()
        }
    }

    func yCoordinate(for value: Double, in rect: CGRect) -> CGFloat {
        let minY = rect.minY
        let maxY = rect.maxY
        let dataMin = sparklineData.min() ?? 0
        let dataMax = sparklineData.max() ?? 0
        let normalizedValue = CGFloat((value - dataMin) / (dataMax - dataMin))
        return maxY - normalizedValue * (maxY - minY)
    }
}
