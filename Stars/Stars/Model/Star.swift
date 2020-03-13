//
//  Star.swift
//  Stars
//
//  Created by Matthew Martindale on 2/13/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

struct Star: Codable {
    var name: String
    var distanceInLightYears: Double
    
    var distanceDescription: String {
        return "\(distanceInLightYears) light years away"
    }
}
