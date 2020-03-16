//
//  PersonTableViewCell.swift
//  FindACrew
//
//  Created by Matthew Martindale on 3/12/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    var person: Person? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    private func updateViews() {
        guard let person = person else { return }
        
        nameLabel.text = person.name
        genderLabel.text = person.gender
        yearLabel.text = person.birthYear
    }

}
