//
//  ViewController.swift
//  Lab7_3
//
//  Created by Admin on 23.04.17.
//  Copyright (c) 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchIndicator: UILabel!
    @IBOutlet weak var backgroundSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        backgroundSwitch.setOn(false, animated: false)
        switchIndicator.textColor = UIColor.whiteColor()
        switchIndicator.text = "BackgroundImage: bg2.jpg";
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backgroundSwitchTapped(sender: AnyObject) {
        if backgroundSwitch.on
        {
            switchIndicator.text = "BackgroundImage: bg1.jpg";
        view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1")!)
        }
        else
        {
            switchIndicator.text = "BackgroundImage: bg2.jpg";
            view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2")!)
        }
    }

}

