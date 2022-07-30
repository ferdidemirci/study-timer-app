//
//  ViewController.swift
//  StudyTimer
//
//  Created by Ferdi DEMİRCİ on 18.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    
    var timer:Timer = Timer()
    var playPauseToggle = true
    var startAndPause = true
    var count = 0
    var timerCounting = false
    var studyMinute = 25
    var studySecond = 0
    var breakMinute = 10
    var breakSecond = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTimer(minute: studyMinute, second: studySecond)
    }

    @IBAction func playPauseActionButton(_ sender: Any) {
        
        if playPauseToggle {
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
            timerFunc()
            playPauseToggle = false
        } else {
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            timer.invalidate()
            playPauseToggle = true
        }
        
    }
    
    
    func timerFunc() {
        if startAndPause {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(studyTimer), userInfo: nil, repeats: true)
        } else {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(breakTimer), userInfo: nil, repeats: true)
        }
    }
    
    @objc func studyTimer() {
        if (studySecond > 0) {
            studySecond -= 1
            updateTimer(minute: studyMinute, second: studySecond)
        } else if (studyMinute > 0 && studySecond == 0) {
            studyMinute -= 1
            studySecond = 59
            updateTimer(minute: studyMinute, second: studySecond)
        } else if (studyMinute == 0 && studySecond == 0) {
            timer.invalidate()
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            studyMinute = 25
            studySecond = 0
            startAndPause = false
            playPauseToggle = true
            updateTimer(minute: breakMinute, second: breakSecond)
        }
    }
    
    @objc func breakTimer() {
        if (breakSecond > 0) {
            breakSecond -= 1
            updateTimer(minute: breakMinute, second: breakSecond)
        } else if (breakMinute > 0 && breakSecond == 0) {
            breakMinute -= 1
            breakSecond = 59
            updateTimer(minute: breakMinute, second: breakSecond)
        } else if (breakMinute == 0 && breakSecond == 0) {
            timer.invalidate()
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
            breakMinute = 10
            breakSecond = 0
            startAndPause = true
            playPauseToggle = true
            updateTimer(minute: studyMinute, second: studySecond)
        }
    }
    
    func updateTimer(minute : Int, second : Int) {
        
        if second < 10 && minute < 10 {
            timeLabel.text = "0\(minute):0\(second)"
        } else if minute < 10{
            timeLabel.text = "0\(minute):\(second)"
        } else if second < 10{
            timeLabel.text = "\(minute):0\(second)"
        } else {
            timeLabel.text = "\(minute):\(second)"
        }
    }
        
    @IBAction func refreshButton(_ sender: Any) {
        timer.invalidate()
        playPauseToggle = true
        count = 0
        timerCounting = false
        studyMinute = 25
        studySecond = 0
        breakMinute = 5
        breakSecond = 0
        playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        updateTimer(minute: studyMinute, second: studySecond)    }
    
}

