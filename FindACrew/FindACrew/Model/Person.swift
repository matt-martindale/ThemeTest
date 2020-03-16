//
//  Person.swift
//  FindACrew
//
//  Created by Matthew Martindale on 3/12/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

struct  Person: Decodable {
    let name: String
    let gender: String
    let birthYear: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case birthYear = "birth_year"
    }
}

struct PersonSearch: Decodable {
    let results: [Person]
}
