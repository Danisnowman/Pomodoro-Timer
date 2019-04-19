//
//  ViewController.swift
//  Pomodoro Timer
//
//  Created by Daniel Hernández on 4/15/19.
//  Copyright © 2019 Daniel Hernández. All rights reserved.
//

import UIKit
import AudioToolbox

class MainTimerViewController: UIViewController {
    
    var stopWatchTimer = Timer()
    var currentTime = 1500
    var pomodoros = 0
    var pomodoroSession = 0
    var initialTime = 1500
    var onRecess = false
    var newSession = false
    let tapVibration = UIImpactFeedbackGenerator(style: .heavy)
    
    
//    let heavytapVibration = UIImpactFeedbackGenerator(style: .heavy)
    
    
    // Mark - IBOulets
    
    @IBOutlet weak var minutesLabel: UILabel!
    
    @IBOutlet weak var secondsLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    @IBOutlet weak var plusFiveSeconds: UIButton!
    
    @IBOutlet weak var pomodorosLabel: UILabel!
    
    @IBOutlet weak var pomodoroSessionsLabel: UILabel!
    
    @IBOutlet weak var currentlyOnLabel: UILabel!
    
    
    
    // Mark - IBActions
    
    @IBAction func pressedStartButton(_ sender: UIButton) {
        startButton.isEnabled = false
        stopButton.isEnabled = true
        initialTime = currentTime
        currentlyOnLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        
        
        stopWatchTimer = Timer.scheduledTimer(
            timeInterval: 0.0000002,
            target: self,
            selector: #selector(MainTimerViewController.updateTime),
            userInfo: nil,
            repeats: true
        )
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
        updateTimeOnViewController(newTime: 1500 - 1)
        
    }
    @objc func updateTime() {
        if currentTime <= 0 {
            stopWatchTimer.invalidate()
            
            print(initialTime)
            print("pomodoros:  \(pomodoros) % 2 = \(pomodoros%2)" )
            
            startButton.isEnabled = true
            stopButton.isEnabled = false
            
            if initialTime == 1500 {
                pomodoros += 1
            }
            
            if  initialTime >= 1200, !(pomodoros % 2 == 0) || pomodoros == 0 {
                print("RECREO: recessTime()")
                recessTime()
            } else if (initialTime == 300 && !(pomodoros % 2 == 0))  || newSession{
                print("POMODORO: pomodoroAfterRecess()")
                pomodoroAfterRecess()
            } else if initialTime == 1500, pomodoros % 2 == 0 {
                print("LONG: pomodoroSessionFinished()")
                pomodoroSessionFinished()
            } else {
                stopWatchTimer.invalidate()
                print("ERROR: else ran")
                pomodoroAfterRecess()
            }
            
            pomodorosLabel.text = String(pomodoros)
        }
        currentTime -= 1
        updateTimeOnViewController(newTime: currentTime - 1)
    }
    
    @objc func updateTimeOnViewController(newTime: Int = 0) {
        currentTime = newTime + 1 // we add 1 to make it inclusive on the ViewController
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
//        if currentTime <= 0 {
//            stopWatchTimer.invalidate()
//            startButton.isEnabled = true
//            stopButton.isEnabled = true
//            pomodoros += 1
//            currentTime = 1500
//        }
    }
    
    func recessTime() {
        tapVibration.impactOccurred()
        startButton.isEnabled = true
        stopButton.isEnabled = true
        currentTime = 301
        currentlyOnLabel.text = "Recess"
        newSession = false
        
    }
    
    func pomodoroAfterRecess() {
        AudioServicesPlaySystemSound(1520)
        startButton.isEnabled = true
        stopButton.isEnabled = false
        currentTime = 1501
        currentlyOnLabel.text = "Pomodoro"
        
    }
    
    func pomodoroSessionFinished() {
        AudioServicesPlaySystemSound(1521)
        startButton.isEnabled = true
        stopButton.isEnabled = false
        newSession = true
        currentTime = 1201
        pomodoroSession += 1
        pomodoroSessionsLabel.text = String(pomodoroSession)
        currentlyOnLabel.text = "Long Recess"
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isEnabled = false
        updateTimeOnViewController(newTime: 1500 - 1)
        currentlyOnLabel.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
    }
    
    
}

