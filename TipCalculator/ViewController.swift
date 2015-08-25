//
//  ViewController.swift
//  TipCalculator
//
//  Created by Vanny Nguyen on 8/25/15.
//  Copyright (c) 2015 Vanny Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //outlets
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    //actions
    @IBAction func calculateTapped(sender:AnyObject){
        tipCalc.total = Double((totalTextField.text as NSString).doubleValue)
        
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        
        var keys = Array(possibleTips.keys)
        sort(&keys)
        for tipPct in keys {
            let tipValue = possibleTips[tipPct]!
            let prettyTipValue = String(format:"%.2f",tipValue)
            results += "\(tipPct)%: \(prettyTipValue)\n"
        }
        resultsTextView.text = results
        
    }
    @IBAction func taxPercentageChanged(sender:AnyObject){
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    @IBAction func viewTapped(sender:AnyObject){
        totalTextField.resignFirstResponder()
    }
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI(){
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        resultsTextView.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

