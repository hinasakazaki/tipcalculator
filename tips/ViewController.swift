//
//  ViewController.swift
//  tips
//
//  Created by Hina Sakazaki on 9/3/15.
//  Copyright (c) 2015 Hina Sakazaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages = [0.18, 0.2, 0.22]
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipControl.selectedSegmentIndex = 1
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        if (defaults.objectForKey("min") != nil){
            tipPercentages[0] = defaults.doubleForKey("min")/100
            tipControl.setTitle(String(format: "%.0f%%", defaults.doubleForKey("min")), forSegmentAtIndex:0)
        }
        if (defaults.objectForKey("def") != nil){
            tipPercentages[1] = defaults.doubleForKey("def")/100
            tipControl.setTitle(String(format: "%.0f%%", defaults.doubleForKey("def")), forSegmentAtIndex:1)
        }
        if (defaults.objectForKey("max") != nil){
            tipPercentages[2] = defaults.doubleForKey("max")/100
            tipControl.setTitle(String(format: "%.0f%%", defaults.doubleForKey("max")), forSegmentAtIndex:2)
        }
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue;
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if (defaults.objectForKey("min") != nil){
            tipPercentages[0] = defaults.doubleForKey("min")/100
            tipControl.setTitle(String(format: "%.0f%%", defaults.doubleForKey("min")), forSegmentAtIndex:0)
        }
        if (defaults.objectForKey("def") != nil){
            tipPercentages[1] = defaults.doubleForKey("def")/100
            tipControl.setTitle(String(format: "%.0f%%", defaults.doubleForKey("def")), forSegmentAtIndex:1)
        }
        if (defaults.objectForKey("max") != nil){
            tipPercentages[2] = defaults.doubleForKey("max")/100
            tipControl.setTitle(String(format: "%.0f%%", defaults.doubleForKey("max")), forSegmentAtIndex:2)
        }
        

        println("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("view did disappear")
    }

}

