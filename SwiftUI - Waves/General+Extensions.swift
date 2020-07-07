//
//  General+Extensions.swift
//  SwiftUI - Waves
//
//  Created by Allen White on 7/6/20.
//  Copyright © 2020 Allen White. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {
    static let darkBlue = Color.with(r: 0, g: 0, b: 153)
    static let mediumBlue = Color.with(r: 0, g: 0, b: 204)
    static let lightBlue = Color.with(r: 0, g: 0, b: 255)
    
    static func with(r: Double, g: Double, b: Double, a: Double = 1) -> Color {
        Color.init(
            red: r / 255.0,
            green: g / 255.0,
            blue: b / 255.0,
            opacity: a / 1.0
        )
    }
}
