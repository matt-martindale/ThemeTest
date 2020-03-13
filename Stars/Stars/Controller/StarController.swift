//
//  StarController.swift
//  Stars
//
//  Created by Matthew Martindale on 2/13/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

//Model controller = Source of Truth
//*** CRUD!! ***
// 1. Create
// 2. Read
// 3. Update
// 4. Delete
// 5. Save
// 6. Load

//private set means, stars can only be set by star controller itself
class StarController {
    private(set) var stars: [Star] = []
    
    private var persistentFileURL: URL? {
        //Singleton = single instance that can be used throughout the app
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else { return nil }
        
        //Users/johhnyhicks/Documents
        return documents.appendingPathComponent("stars.plist")
    }
    
    init() {
        loadFromPersistentStore()
    }
    
    //CRUD functions
    @discardableResult func createStar(named name: String, distance: Double) -> Star {
        let star = Star(name: name, distanceInLightYears: distance)
        stars.append(star)
        saveToPersistentStore()
        return star
    }
    
    func listStars() -> String {
        var output = ""
        for star in stars {
            output += "\(star.name) is \(star.distanceDescription)"
        }
        return output
    }
    
    //save and load
    func saveToPersistentStore() {
        //Star -> Data -> Plist
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
        } catch {
            print("Error saving stars data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        //Plist -> Data -> Stars
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }
}
