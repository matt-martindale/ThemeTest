//
//  SecondViewController.swift
//  themeTest
//
//  Created by Matthew Martindale on 3/5/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var modelController: ModelController
    
    init?(coder: NSCoder, modelController: ModelController) {
        self.modelController = modelController
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("must create VC with a mood")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if modelController.isDarkMode {
            view.backgroundColor = .darkGray
        } else if modelController.isDarkMode == false {
            view.backgroundColor = .white
        }
    }
    
    @IBAction func nextVC(_ sender: Any) {
        navigateToNextVC()
    }
    
    func navigateToNextVC() {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "ThirdVC", creator: { coder in
            return ThirdViewController(coder: coder,modelController: self.modelController)
        }) else { fatalError("failed to load commentVC from storyboard")}
        navigationController?.pushViewController(nextVC, animated: true)
    }


}
