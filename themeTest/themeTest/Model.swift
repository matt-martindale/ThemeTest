//
//  Model.swift
//  themeTest
//
//  Created by Matthew Martindale on 3/5/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

struct Theme {
    var darkModeIsOn: Bool
    
    init(darkModeIsOn: Bool = false) {
        self.darkModeIsOn = darkModeIsOn
    }
}
