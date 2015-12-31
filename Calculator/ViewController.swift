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
    var result = ""
    
    
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
        playSound()
        
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }

    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }

    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }

    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }

    @IBAction func onAddPressed(sender: AnyObject) {
        processOperation(Operation.Add)
    }

    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)
    }

    @IBAction func onClearPressed(sender: AnyObject) {
        rightValStr = ""
        leftValStr = ""
        runningNumber = ""
        currentOperation = Operation.Empty
        outputLbl.text = "0"
    }
    
    func processOperation(op: Operation) {
        playSound()
        
        if currentOperation != Operation.Empty {
            //Run some Math
            
            //A user selected an operator, then another operator without choosing a number
            //This makes sure you dont process the numbers too soon
            if  runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
            }
            currentOperation = op
            
        } else {
            //This is the first time an operator is pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
            
            
        }
    }
    
    func playSound() {
        if btnSound.playing {
            btnSound.stop()
        }
        
        //btnSound.play()
    }

}

