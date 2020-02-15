//
//  Shake.swift
//  SwiftUIPractice
//
//  Created by Wayne Hsiao on 2020/2/15.
//  Copyright © 2020 Wayne Hsiao. All rights reserved.
//

import SwiftUI

//https://www.objc.io/blog/2019/10/01/swiftui-shake-animation/
struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let animation = amount * sin(animatableData * .pi * CGFloat(shakesPerUnit))
        
        return ProjectionTransform(CGAffineTransform(translationX:
            animation,
            y: 0))
    }
}
