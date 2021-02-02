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
    @IBOutlet weak var numPayerTextField: UITextField!
    @IBOutlet weak var totalPerPayer: UILabel!
    

    @IBOutlet var topConstraintHeight: NSLayoutConstraint!
    @IBAction func splitButton(_ sender: Any) {
        topConstraintHeight.constant = 300;
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseOut, animations: { self.view.layoutIfNeeded()}, completion: nil)
    }
    
    @IBAction func stepperNumPayer(_ sender: UIStepper) {
        numPayerTextField.text = String(sender.value)
    }
    
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
        
        // Derive number of payees
        let numPayer = Double(numPayerTextField.text!) ?? 0
        let eachPayer = total/numPayer
        
        // Update total per payee label
        totalPerPayer.text  = String(format: "$%.2f", eachPayer)
    }
}

