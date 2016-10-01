//
//  ViewController.swift
//  tipcal
//
//  Created by Jiachen Zhao on 9/21/16.
//  Copyright © 2016 Jiachen Zhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var resultView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        showTipAndTotalInLocalCurrency()
        
        if (resultView.alpha == 0) {
            UIView.animate(withDuration: 2, animations: {
                self.resultView.alpha = 1
            })
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let tipDefaults = UserDefaults.standard;
        let bill = tipDefaults.double(forKey: "lastBillAmount")
        let currencyFormatter = NumberFormatter()

        billField.text = currencyFormatter.string(for: bill)
        if (billField.text == "0") {
            billField.text = ""
        }
        var tipIndex = tipDefaults.integer(forKey: "DefaultTip")
        if ( tipIndex < 0 || tipIndex > 2) {
            tipIndex = 0
        }
        tipControl.selectedSegmentIndex = tipIndex
        
        showTipAndTotalInLocalCurrency()

        if (billField.text == "") {
            resultView.alpha = 0
        }
        showTipAndTotalInLocalCurrency()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        let bill = Double(billField.text!) ?? 0
        userDefaults.set(bill, forKey:"lastBillAmount")
        userDefaults.synchronize()
        super.viewWillDisappear(animated)
    }
    
    func showTipAndTotalInLocalCurrency() {
        let tipPercentages = [0.18, 0.2, 0.25]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.maximumFractionDigits = 2;
        
        tipLabel.text = currencyFormatter.string(for: tip)
        totalLabel.text = currencyFormatter.string(for: total)
    }
}

