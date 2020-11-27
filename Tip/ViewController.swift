//
//  ViewController.swift
//  Tip
//
//  Created by Tanav Kudupudi on 11/27/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let tipPercentages = [0.15, 0.18, 0.2]
    let defaults = UserDefaults.standard
    var percentIndex = 0
    var themeIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // Enable keyboard on start
        billAmountTextField.becomeFirstResponder()
        
        // Load tip and theme indices from UserDefaults
        percentIndex = defaults.integer(forKey: "percentIndex")
        themeIndex = defaults.integer(forKey: "themeIndex")
        
        // Get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Recalculate tip and total
        let tip = bill * tipPercentages[percentIndex]
        let total = bill + tip
        
        // Update tip percent, tip amount, and total labels
        tipPercentageLabel.text = String(format: "Tip (%.0f%%)", tipPercentages[percentIndex] * 100)
        totalLabel.text = String(format: "$%.2f", total)
        
        // Update dark mode appearance
        switch themeIndex {
        case 0:
            overrideUserInterfaceStyle = .light
        case 1:
            overrideUserInterfaceStyle = .dark
        case 2:
            overrideUserInterfaceStyle = .unspecified
        default:
            overrideUserInterfaceStyle = .unspecified
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }

    @IBAction func onTap(_ sender: Any) {
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get initial bill amount and calculate tips
        let bill = Double(billAmountTextField.text!) ?? 0
                
        // Calculate tip and total
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
                
        // Update tip and total labels
        tipPercentageLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

