//
//  Timer.swift
//  Work_TimeCounter
//
//  Created by Luis Benvenuto on 21/06/24.
//

import Foundation
import Observation
enum TimerState: String{
    case idle
    case running
    case paused
    
}

enum TimerMode: String{
    case work
    case pause
}
@Observable
class PomTimer {
    
    // timer -> tick everysecond
    //properties -> how many seconds left / passed
    //           -> fraction 0-1
    //           -> String ... 10:42
    // methods -> play, pause, resume, reset, skip
    // helper function
    
    private var _mode: TimerMode = .work
    private var _state: TimerState = .idle
    
    private var _durationWork: TimeInterval
    private var _durationBreak: TimeInterval
    
    private var _secondsPassed: Int = 0
    private var _fractionPassed: Double = 0
    private var _dateStarted: Date = Date.now
    private var _secondsPassedBeforePause: Int = 0
    
    private var _timer: Timer?
    
    init(workInSeconds: TimeInterval, breakInSeconds: TimeInterval){
        _durationWork = workInSeconds
        _durationBreak = breakInSeconds
    }
    func setWorkDuration(workInSeconds: TimeInterval){
        _durationWork = workInSeconds
    }
    func setBreakDuration(breakInSeconds: TimeInterval){
        _durationBreak = breakInSeconds
    }
    
    //Mark: Computed Properties
    var secondsLeft: Int {
        Int(_duration) - _secondsPassed
    }
    var secondsLeftString: String{
        return _formatSeconds(secondsLeft)
    }
    var secondsPassed: Int {
        return _secondsPassed
    }
    var secondsPassedString: String {
        return _formatSeconds(_secondsPassed)
    }
    var fractionPassed: Double {
        return _fractionPassed
    }
    var fractionLefti: Double {
        1.0 - _fractionPassed
    }
    
    var state: TimerState {
        _state
    }
    var mode: TimerMode {
        _mode
    }
    
    
    private var _duration: TimeInterval {
        // código original sin guión
        if mode == .work {
            return _durationWork
        }else{
            return _durationBreak
        }
    }
    
    // Mark: public methods
    func start(){
        _dateStarted = Date.now
        _secondsPassed = 0
        _fractionPassed = 0
        _state = .running
        _createTimer()
    }
    func resume(){
        _dateStarted = Date.now
        _state = .running
        _createTimer()
    }
    func pause(){
        _secondsPassedBeforePause = _secondsPassed
        _state = .paused
        _killTimer()
    }
    func reset(){
        _secondsPassed = 0
        _fractionPassed = 0
        _secondsPassedBeforePause = 0
        _state = .idle
        _killTimer()
    }
    func skip(){
        if self._mode == .work{
            self._mode = .pause
        }else{
            self._mode = .work
        }
    }
    
    //Mark: private methods
    private func _createTimer(){
        _timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self._onTick()
        }
    }
    private func _killTimer(){
        _timer?.invalidate()
        _timer = nil
    }
    
    private func _onTick(){
        //calculate the seconds sicne start date
        let secondsSinceStartDate = Date.now.timeIntervalSince(self._dateStarted)
        
        //add the seconds before paused
        self._secondsPassed = Int(secondsSinceStartDate) + self._secondsPassedBeforePause
        //calculate fraction
        self._fractionPassed = TimeInterval(self._secondsPassed) / self._duration
        // stop timer, reset timer
        if self.secondsLeft == 0{
            self._fractionPassed = 0
            self.skip() // to switch mode
            self.reset() // also resets timer
            
        }
    }
    private func _formatSeconds(_ seconds: Int) -> String{
        if seconds <= 0 {
            return "00:00"
        }
        let hh: Int = seconds/3600
        let mm: Int = (seconds % 3600) / 60
        let ss: Int = seconds % 60
        if hh > 0 {
            return String(format: "%02d:%02d:%02d", hh, mm, ss)
        }
        else{
            return String(format: "%02d:%02d", mm, ss)
        }
    }
}
