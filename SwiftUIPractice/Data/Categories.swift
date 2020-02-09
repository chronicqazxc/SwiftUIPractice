//
//  Categories.swift
//  SwiftUIPractice
//
//  Created by Wayne Hsiao on 2020/2/8.
//  Copyright © 2020 Wayne Hsiao. All rights reserved.
//

import Foundation

enum Categories: String, CaseIterable {
    case devices
    case transportation
    case nature
    case time
    case health
    case weather
    
    var symbols: [String] {
        
        switch self {
        case .devices:
            return [
                "keyboard",
                "hifispeaker",
                "printer",
                "tv",
                "desktopcomputer",
                "gamecontroller",
                "headphones"
            ]
        case .transportation:
            return [
                "car",
                "tram.fill",
                "airplane"
            ]
        case .nature:
            return [
                "flame",
                "bolt",
                "bolt.circle",
                "bolt.slash",
                "ant",
                "ant.circle",
                "hare",
                "tortoise"
            ]
        case .time:
            return [
                "clock",
                "alarm",
                "stopwatch",
                "timer"
            ]
        case .health:
            return [
                "heart",
                "heart.circle",
                "bandage",
                "bed.double",
                "waveform.path.ecg",
                "staroflife"
            ]
        case .weather:
            return [
                "sun.min",
                "sun.max",
                "sunrise",
                "sunset",
                "sun.dust",
                "sun.haze",
                "moon",
                "cloud",
                "cloud.drizzle",
                "cloud.rain",
                "cloud.heavyrain",
                "cloud.fog",
                "cloud.hail",
                "cloud.snow",
                "cloud.sleet",
                "cloud.bolt",
                "wind",
                "snow",
                "tornado",
                "tropicalstorm",
                "thermometer.sun",
                "thermometer.snowflake",
                "thermometer",
            ]
        }
    }
}
