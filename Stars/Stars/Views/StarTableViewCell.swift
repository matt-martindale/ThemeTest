//
//  StarTableViewCell.swift
//  Stars
//
//  Created by Matthew Martindale on 2/13/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {

    var star: Star? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    private func updateViews() {
        nameLabel.text = star?.name
        distanceLabel.text = star?.distanceDescription
    }

}
