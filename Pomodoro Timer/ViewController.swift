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
    
    // IBOulets
    
    @IBOutlet weak var minutesLabel: UILabel!
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var pauseButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    
    
    // IBActions
    
    @IBAction func pressedStartButton(_ sender: UIButton) {
        // Timer has started, 'Start' button can disappear as it's not needed for now
        startButton.isHidden = true
        startButton.isEnabled = false
        
        // Timer has started, 'Start' button is not needed but 'Pause' is
        pauseButton.isHidden = false
        
        pauseButton.isEnabled = true
        
        // 'Stop' button is needed
        stopButton.isEnabled = true
        
        stopWatchTimer = Timer.scheduledTimer(timeInterval: 0.00025, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
    }
    
    @IBAction func pressedPauseButton(_ sender: UIButton) {
        print("pressedPauseButton(): working")
        
        // Timer is paused, show 'Start' button
        startButton.isHidden = false
        startButton.isEnabled = true
        
        // 'Pause' button is not needed as start is shown now
        pauseButton.isHidden = true
        
        
        //stopButton.isEnabled = false
        
        stopWatchTimer.invalidate()
        
    }
    
    @IBAction func pressedStopButton(_ sender: UIButton) {
        startButton.isHidden = false
        startButton.isEnabled = true
        pauseButton.isHidden = true
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
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pauseButton.isHidden = true
        stopButton.isEnabled = false
    }


}

