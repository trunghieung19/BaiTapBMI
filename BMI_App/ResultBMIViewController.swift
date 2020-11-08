//
//  ResultBMIViewController.swift
//  BMI_App
//
//  Created by Apple on 11/8/20.
//  Copyright © 2020 trunghieu. All rights reserved.
//

import UIKit

class ResultBMIViewController: UIViewController {
    
    
    var evaluate: String = ""
    var index: String = ""
    var descriptionYourBody: String = ""
    var passData: ((_ name: String) -> Void)?

    @IBOutlet weak var evaluateBMILabel: UILabel!
    @IBOutlet weak var indexBMILabel: UILabel!
    @IBOutlet weak var descriptionYourBodyLabel: UILabel!
    @IBOutlet weak var reCaculatorViewButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        evaluateBMILabel.text = evaluate
        indexBMILabel.text = index
        descriptionYourBodyLabel.text = descriptionYourBody
        
        reCaculatorViewButton.layer.cornerRadius = 8
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func reCaculatorButton(_ sender: UIButton) {
        passData?("HIEU")
        dismiss(animated: true, completion: nil)
    }
    
}
