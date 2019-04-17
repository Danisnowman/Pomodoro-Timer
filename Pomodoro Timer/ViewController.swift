//
//  ViewController.swift
//  Pomodoro Timer
//
//  Created by Daniel Hernández on 4/15/19.
//  Copyright © 2019 Daniel Hernández. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var stopWatchTimer = Timer()
    var currentTime = 1500
    var pomodoros = 0
    
    // IBOulets
    
    @IBOutlet weak var minutesLabel: UILabel!
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var swipeLabel: UILabel!
    
    @IBOutlet weak var plusFiveSeconds: UIButton!
    
    // IBActions
    
    @IBAction func pressedStartButton(_ sender: UIButton) {
        startButton.isEnabled = false
        stopButton.isEnabled = true
        
        stopWatchTimer = Timer.scheduledTimer(timeInterval: 0.0000025, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func plusFiveMinutes(_ sender: UIButton) {
        if currentTime < 1200 {
         currentTime += 300
        }
    }

    
    @IBAction func pressedStopButton(_ sender: UIButton) {
        startButton.isHidden = false
        startButton.isEnabled = true
        stopButton.isEnabled = false
        
        stopWatchTimer.invalidate()
        currentTime = 1500
        
    }
    
    @objc func updateTime() {
        currentTime -= 1
        if currentTime % 60 < 10 {
            secondsLabel.text = "0\(currentTime % 60)"
        } else {
            secondsLabel.text = "\(currentTime % 60)"
        }
        
        if currentTime / 60 < 10 {
            minutesLabel.text = "0\(currentTime / 60)"
        } else {
            minutesLabel.text = "\(currentTime / 60)"
        }
        if currentTime == 0 {
            stopWatchTimer.invalidate()
            stopButton.isEnabled = false
            pomodoros += 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        pauseButton.isHidden = true
        stopButton.isEnabled = false
        
    }
    
    
}

