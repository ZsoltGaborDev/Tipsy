//
//  ResultVC.swift
//  Tipsy
//
//  Created by zsolt on 06/12/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var total: String?
    var percentage: Double?
    var split: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total
        settingsLabel.text = "Split between \(split ?? 2) people, with \(percentage ?? 0)% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
