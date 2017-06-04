//
//  ViewController.swift
//  Lab7_4
//
//  Created by Admin on 26.05.17.
//  Copyright (c) 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gestureIndicator: UILabel!
    
    @IBAction func tap(sender: AnyObject) {
        gestureIndicator.text = "Жест: касание\nЦвет фона: зелёный"
        gestureIndicator.backgroundColor = UIColor.greenColor()
    }
    
    @IBAction func pinch(sender: AnyObject) {
        gestureIndicator.text = "Жест: масштабирование\nЦвет фона: красный"
        gestureIndicator.backgroundColor = UIColor.redColor()
    }
   
    @IBAction func rotate(sender: AnyObject) {
        gestureIndicator.text = "Жест: вращение\nЦвет фона: синий"
        gestureIndicator.backgroundColor = UIColor.blueColor()
    }
    
    @IBAction func swipe(sender: AnyObject) {
        gestureIndicator.text = "Жест: смахивание\nЦвет фона: серый"
        gestureIndicator.backgroundColor = UIColor.lightGrayColor()
    }
    
    @IBAction func longPress(sender: AnyObject) {
        gestureIndicator.text = "Жест: долгое нажатие\nЦвет фона: оранжевый"
        gestureIndicator.backgroundColor = UIColor.orangeColor()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gestureIndicator.userInteractionEnabled = true
        gestureIndicator.textAlignment = NSTextAlignment.Center
        gestureIndicator.numberOfLines = 2
        gestureIndicator.text = "Используйте жесты в этой области"
        gestureIndicator.backgroundColor = UIColor.yellowColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

