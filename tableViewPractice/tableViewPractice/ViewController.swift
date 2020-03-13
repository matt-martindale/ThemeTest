//
//  ViewController.swift
//  tableViewPractice
//
//  Created by Matthew Martindale on 2/17/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var wordTableView: UITableView!
    var words: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.wordTableView.delegate = self
        self.wordTableView.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = wordTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell()}
        let word = words[indexPath.row]
        cell.wordLabel.text = word
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWordSegue" {
            let addWordVC = segue.destination as! AddTextViewController
            addWordVC.delegate = self
        }
    }
    
    
}

extension ViewController: TableViewDelegate {
    func addWord(_ word: String) {
        words.append(word)
        wordTableView.reloadData()
    }
}

