//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by AnushaValasapalli on 9/21/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    var splitBill = Double()
    var splitBetween = String()
    var splitPercentage = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = String(splitBill)
        let text = "split between" + String(splitBetween) + "people, with" + String(splitPercentage) + "tip."
        settingsLabel.text = text
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func recalculateButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
