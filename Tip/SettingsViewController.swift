//
//  SettingsViewController.swift
//  Tip
//
//  Created by Tanav Kudupudi on 11/27/20.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var percentControl: UISegmentedControl!
    @IBOutlet weak var themeControl: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Settings"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
            
        // Load UserDefault settings
        let percentIndex = defaults.integer(forKey: "percentIndex")
        let themeIndex = defaults.integer(forKey: "themeIndex")
            
        // Make sure selected segment control indices are same as UserDefault
        percentControl.selectedSegmentIndex = percentIndex
        themeControl.selectedSegmentIndex = themeIndex
            
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
    
    @IBAction func changeTipPercentage(_ sender: Any) {
        defaults.set(percentControl.selectedSegmentIndex, forKey: "percentIndex")
    }
    
    @IBAction func changeDarkMode(_ sender: Any) {
        defaults.set(themeControl.selectedSegmentIndex, forKey: "themeIndex")
        
        switch themeControl.selectedSegmentIndex {
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
