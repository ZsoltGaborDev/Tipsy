//
//  ViewController.swift
//  Tipsy
//
//  Created by zsolt on 06/12/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPctBtn: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var percentageSelected: Double!
    var calculator = TipCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.addShadow()
        zeroPctBtn.addShadow()
        tenPctBtn.addShadow()
        twentyPctBtn.addShadow()
        splitNumberLabel.addShadow()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        switch sender {
        case zeroPctBtn:
            percentageSelected = 0.0
            zeroPctBtn.isSelected = true
            tenPctBtn.isSelected = false
            twentyPctBtn.isSelected = false
        case tenPctBtn:
            percentageSelected = 10.0
            zeroPctBtn.isSelected = false
            tenPctBtn.isSelected = true
            twentyPctBtn.isSelected = false
        case twentyPctBtn:
            percentageSelected = 20.0
            zeroPctBtn.isSelected = false
            tenPctBtn.isSelected = false
            twentyPctBtn.isSelected = true
        default:
            print("Error changing tip percentage")
        }
        billTextField.endEditing(true)
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculateBtnPressed(_ sender: UIButton) {
        setBillTextFieldValue()
        if Double(billTextField.text!) != nil {
            let totalBill = Double(billTextField.text!.trimmingCharacters(in: .whitespaces))
            let split = Double(splitNumberLabel.text!.trimmingCharacters(in: .whitespaces))
            calculator.calculateValue(totalBill: totalBill!, percentageSelected: percentageSelected, splitNumber: split!)
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultVC
        destinationVC.total = calculator.getValue()
        destinationVC.percentage = percentageSelected
        destinationVC.split = Double(splitNumberLabel.text!)
    }
    func setBillTextFieldValue() {
        for unit in billTextField.text! {
            if unit == "," {
                let index = billTextField.text?.firstIndex(of: ",")
                billTextField.text?.remove(at: index!)
                billTextField.text?.insert(".", at: index!)
            }
        }
    }
}

