//
//  BackgroundColors.swift
//  SwiftUIPractice
//
//  Created by Wayne Hsiao on 2020/2/6.
//  Copyright © 2020 Wayne Hsiao. All rights reserved.
//

import Foundation
import SwiftUI

let ThemeColors = [
    Color.blue,
    Color.red,
    Color.green,
]

func DescriptionFromColor(_ color: Color) -> String {
    switch color {
    case .red:
        return "Red"
    case .blue:
        return "Blue"
    case .green:
        return "Green"
    default:
        return "Unknow"
    }
}
