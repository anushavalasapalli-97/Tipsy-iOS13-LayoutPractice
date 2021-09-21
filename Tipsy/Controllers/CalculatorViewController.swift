//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButtin: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipPercentage = String()
    var finalSplitBill = Double()
    var splitBetween = String()
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.resignFirstResponder()
        sender.isSelected = !sender.isSelected
        tipPercentage = sender.titleLabel?.text ?? ""
    
        zeroPctButtin.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let stepperValue = sender.value
        print(stepperValue)
        let convert = Int(stepperValue)
        print(convert)
        
        
        splitNumberLabel.text = String(convert)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        print("tipPercentage",tipPercentage)
        print("billAmount", billTextField.text)
        print("totalMembers",splitNumberLabel.text)
        splitBetween = splitNumberLabel.text!
        if (tipPercentage.count > 0) && (billTextField.text?.count ?? 0 > 0) && (splitNumberLabel.text?.count ?? 0 > 0) {

        let removePercentageSymbolFromTip = tipPercentage.dropLast(1)
        print("removePercentageSymbolFromTip",removePercentageSymbolFromTip)
        
        let convertTipToDouble = Double(removePercentageSymbolFromTip) ?? 0.0
        print("convertTipToDouble",convertTipToDouble)
        let convertTotalAmounttoDouble = Double(billTextField.text!) ?? 0.0
        print("convertTotalAmounttoDouble",convertTotalAmounttoDouble)
        
        let percentageDivededByHundred:Double = (convertTipToDouble / 100)
        print("percentageDivededByHundred:%@",percentageDivededByHundred)
        
        let finalPercentageCalculation = convertTotalAmounttoDouble * percentageDivededByHundred
        print("finalPercentageCalculation:%@",finalPercentageCalculation)
        
        let finalResult:Double = Double(convertTotalAmounttoDouble + finalPercentageCalculation)
        print("finalResult",finalResult)
        
        let convertDoubleToSplitMembersCount = Double(splitNumberLabel.text!) ?? 0.0
        print("convertDoubleToSplitMembersCount",convertDoubleToSplitMembersCount)
        let convertDoubleTosplitAmount = Double(round(finalResult / convertDoubleToSplitMembersCount))
        print("convertDoubleTosplitAmount",convertDoubleTosplitAmount)
            finalSplitBill = convertDoubleTosplitAmount
            self.performSegue(withIdentifier: "ResultsViewController", sender: self)
        }
        else {
            let alertController = UIAlertController(title: "Alert", message: "Please fill Bill Total, Select Tip, Choose Split", preferredStyle:.alert)

            alertController.addAction(UIAlertAction(title: "OK", style: .default)
              { action -> Void in
                // Put your code here
              })
            self.present(alertController, animated: true, completion: nil)
            
        }
     
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsViewController" {
            let destination = segue.destination as! ResultsViewController
            destination.splitBill = finalSplitBill
            destination.splitBetween = self.splitBetween
            destination.splitPercentage = self.tipPercentage
        }
    }
    
}

