//
//  ViewController.swift
//  Calculator
//
//  Created by Zachary Ryan on 12/29/15.
//  Copyright © 2015 Zachary Ryan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Equal = "="
        case Empty = ""
    }

    @IBOutlet weak var outputLbl: UILabel!
    
    //Sounds
    var btnSound: AVAudioPlayer!
    
    //Main variables
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var currentOperation: Operation = Operation.Empty
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundUrl)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    
    }

    //Actions
    
    @IBAction func numberPressed(btn: UIButton!) {
        btnSound.play()
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }

    @IBAction func onDividePressed(sender: AnyObject) {
        
    }

    @IBAction func onMultiplyPressed(sender: AnyObject) {
        
    }

    @IBAction func onSubtractPressed(sender: AnyObject) {
        
    }

    @IBAction func onAddPressed(sender: AnyObject) {
        
    }

    @IBAction func onEqualPressed(sender: AnyObject) {
        
    }



}

