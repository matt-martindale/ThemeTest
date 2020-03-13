//
//  AddTextViewController.swift
//  tableViewPractice
//
//  Created by Matthew Martindale on 2/17/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

protocol TableViewDelegate {
    func addWord(_ word: String)
}

class AddTextViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    var delegate: TableViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let word = textField.text {
            delegate?.addWord(word)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
}
