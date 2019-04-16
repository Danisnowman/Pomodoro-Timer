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
    var currentTime = 0
    
    // IBOulets
    
    @IBOutlet weak var minutesLabel: UILabel!
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    
    
    // IBActions
    
    @IBAction func pressedStartButton(_ sender: UIButton) {
        startButton.isHidden = true
        pauseButton.isHidden = false
        stopButton.isEnabled = true
        
        stopWatchTimer = Timer.scheduledTimer(timeInterval: 0.005, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func pressedPauseButton(_ sender: UIButton) {
        startButton.isHidden = false
        pauseButton.isHidden = true
        
        // Pausing Timer
        stopWatchTimer.invalidate() // Pauses the Timer
        
    }
    
    @IBAction func pressedStopButton(_ sender: UIButton) {
        startButton.isHidden = false
        pauseButton.isHidden = true
        stopButton.isEnabled = false
        
        stopWatchTimer.invalidate()
        currentTime = 0
    }
    
    @objc func updateTime() {
        currentTime += 1
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
        if currentTime == 1500 {
            stopWatchTimer.invalidate()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pauseButton.isHidden = true
        stopButton.isEnabled = false
    }


}

