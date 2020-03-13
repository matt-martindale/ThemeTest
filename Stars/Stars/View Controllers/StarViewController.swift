//
//  StarViewController.swift
//  Stars
//
//  Created by Matthew Martindale on 2/13/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class StarViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var starNameTextField: UITextField!
    @IBOutlet weak var distanceTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    //source of truth
    let starController = StarController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
    }

    @IBAction func printButtonTapped(_ sender: Any) {
        print(starController.listStars())
    }
    
    @IBAction func createButtonTapped(_ sender: Any) {
        guard let name = starNameTextField.text,
        let distanceString = distanceTextField.text,
        !name.isEmpty,
        !distanceString.isEmpty,
        let distance = Double(distanceString) else { return }
        
        starController.createStar(named: name, distance: distance)
        starNameTextField.text = ""
        distanceTextField.text = ""
        starNameTextField.becomeFirstResponder()
        tableView.reloadData()
    }
}

extension StarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starController.stars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "StarCell", for: indexPath) as? StarTableViewCell else { return UITableViewCell() } 
        
        let star = starController.stars[indexPath.row]
        cell.star = star
        return cell
    }
    
    
}
