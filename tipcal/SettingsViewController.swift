//
//  SettingsViewController.swift
//  tipcal
//
//  Created by Jiachen Zhao on 9/25/16.
//  Copyright © 2016 Jiachen Zhao. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let userDefaults = UserDefaults.standard
        defaultTipController.selectedSegmentIndex = userDefaults.integer(forKey: "DefaultTip")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        let selectIndex = defaultTipController.selectedSegmentIndex
        userDefaults.set(selectIndex, forKey: "DefaultTip")
        userDefaults.synchronize()
        super.viewWillDisappear(animated)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }/Users/zhaojiac/Documents/ios_workspaces/tipcal/tipcal/SettingsViewController.swift
    */

}
