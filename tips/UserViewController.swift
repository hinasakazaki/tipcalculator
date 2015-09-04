//
//  UserViewController.swift
//  tips
//
//  Created by Hina Sakazaki on 9/3/15.
//  Copyright (c) 2015 Hina Sakazaki. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

//    var defaults = NSUserDefaults.standardUserDefaults()
//    defaults.setObject("some_string_to_save", forKey: "some_key_that_you_choose")
//    defaults.setInteger(123, forKey: "another_key_that_you_choose")
//    defaults.synchronize()
//    
    @IBOutlet weak var defaultTipPerc: UITextField!
    @IBOutlet weak var minTipPerc: UITextField!
    @IBOutlet weak var maxTipPerc: UITextField!
    var defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (defaults.objectForKey("def") != nil){
            defaultTipPerc.text = String(format: "%.0f", defaults.doubleForKey("def"))
        }
        if (defaults.objectForKey("min") != nil){
            minTipPerc.text = String(format: "%.0f", defaults.doubleForKey("min"))
        }
        if (defaults.objectForKey("max") != nil){
            defaultTipPerc.text = String(format: "%.0f", defaults.doubleForKey("max"))
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnBackTap(sender: AnyObject) {
        defaults.synchronize()
        dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing((true))
    }
    
    @IBAction func onMaxChanged(sender: AnyObject) {
        defaults.setDouble((maxTipPerc.text as NSString).doubleValue, forKey: "max")
    }
    @IBAction func onMinChanged(sender: AnyObject) {
        defaults.setDouble((minTipPerc.text as NSString).doubleValue, forKey: "min")
    }
    @IBAction func onDefaultChanged(sender: AnyObject) {
        defaults.setDouble((defaultTipPerc.text as NSString).doubleValue, forKey: "def")
    }
}
