//
//  Wave.swift
//  SwiftUI - Waves
//
//  Created by Allen White on 7/6/20.
//  Copyright © 2020 Allen White. All rights reserved.
//

import SwiftUI

struct Wave: Shape {
    let graphWidth: CGFloat
    let amplitude: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height

        let origin = CGPoint(x: 0, y: height * 0.85)

        var path = Path()
        path.move(to: origin)

        let step = 5.0
        for angle in stride(from: -360, through: Double(width) * (step * step), by: step) {
            let x = origin.x + CGFloat(angle/360.0) * width * self.graphWidth
            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * self.amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: (origin.x + CGFloat(-1.0) * width * self.graphWidth), y: height))
        path.addLine(to: CGPoint(x: (origin.x + CGFloat(-1.0) * width * self.graphWidth), y: origin.y))

        return path
    }
}

struct Wave_Previews: PreviewProvider {
    static var previews: some View {
        Wave(graphWidth: 0.68, amplitude: 0.02)
            .offset(x: 100, y: .zero)
    }
}
