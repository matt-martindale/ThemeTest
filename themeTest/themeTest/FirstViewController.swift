//
//  FirstViewController.swift
//  themeTest
//
//  Created by Matthew Martindale on 3/9/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    let modelController = ModelController()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func lightModeBtnPressed(_ sender: Any) {
        modelController.isDarkMode = false
        view.backgroundColor = .white
    }

    @IBAction func darkModeBtnPressed(_ sender: Any) {
        modelController.isDarkMode = true
        view.backgroundColor = .darkGray
    }

    @IBAction func nextVC(_ sender: Any) {
        navigateToCommentVC()
    }

    func navigateToCommentVC() {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "SecondVC", creator: { coder in
            return SecondViewController(coder: coder, modelController: self.modelController)
        }) else { fatalError("failed to load commentVC from storyboard")}
        navigationController?.pushViewController(nextVC, animated: true)
    }

}
