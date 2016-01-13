//
//  ViewController.swift
//  multiples
//
//  Created by Mo Zhu on 1/12/16.
//  Copyright © 2016 Mo Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var multiple: Int = 0
    var currentCount: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var multiplesField: UITextField!
    @IBOutlet weak var gameTitle: UIImageView!
    @IBOutlet weak var tapsCount: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    @IBAction func startGame(sender: AnyObject) {
        if multiplesField.text == nil {
            let alert = UIAlertController(title: "Error", message: "You must enter a multiple!", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            multiple = Int(multiplesField.text!)!
            currentCount = 0
            
            toggleScreens()
        }
    }
    
    @IBAction func addMultiple(sender: AnyObject) {
        currentCount += multiple
        
        tapsCount.text = "\(currentCount) Taps"
        if currentCount >= 30 {
            toggleScreens()
            tapsCount.text = "0 Taps"
        }
    }
    
    func toggleScreens() {
        for element in [tapsCount, addButton, gameTitle, multiplesField, playButton] {
            element.hidden = !element.hidden
        }
    }
}

