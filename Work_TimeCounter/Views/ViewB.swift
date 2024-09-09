//
//  ViewB.swift
//  Work_TimeCounter
//
//  Created by Luis Benvenuto on 21/06/24.
//

import SwiftUI

struct ViewB: View {
    private var timer = PomTimer(workInSeconds: 10, breakInSeconds: 5)
    @State private var amTime = 0
    @State var wMin: Int = 0
    @State var bMin: Int = 0
    
    var body: some View {
        VStack{
            Stepper("Work: \(wMin)", value: $wMin)
                .padding()
            Stepper("Break \(bMin)", value: $bMin)
                .padding()
            
            
            
            CircleTimer(fraction: timer.fractionPassed, primaryText: timer.secondsLeftString, secondaryText: timer.mode.rawValue)
            
        
            //buttons
            HStack {
                if timer.state == .idle && timer.mode == .pause {
                    CircleButton(icon: "forward.fill") {
                        timer.skip()
                    }
                }
                if timer.state == .idle{
                    CircleButton(icon: "play.fill"){
                        timer.setWorkDuration(workInSeconds: Double(wMin*60))
                        timer.setBreakDuration(breakInSeconds: Double(bMin*60))
                        
                        timer.start()
                    }
                }
                if timer.state == .paused {
                    CircleButton(icon: "play.fill") {
                        timer.resume()
                    }
                }
                if timer.state == .running{
                    CircleButton(icon: "pause.fill") {
                        timer.pause()
                    }
                }
                if timer.state == .running || timer.state == .paused {
                    CircleButton(icon: "stop.fill") {
                        timer.reset()
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RadialGradient(
                gradient: Gradient(colors: [Color("Light"), Color("Dark")]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
        )
    }
}


#Preview {
    ViewB()
}
