//
//  ViewController.swift
//  CodePath Prework
//
//  Created by Chantel Ngoh on 1/2/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from input text field
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Calculate tip (bill * tipControl)
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        // Calculate total
        let total = tip + bill
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update total amount label
        totalLabel.text = String(format: "$%.2f", total)
    }
}

