//
//  ContentView.swift
//  Work_TimeCounter
//
//  Created by Luis Benvenuto on 20/06/24.
//

import SwiftUI

struct ContentView: View {
    
    private var timer = PomTimer(workInSeconds: 100, breakInSeconds: 5)
    
    var body: some View{
        TabView{
            ViewA()
                .tabItem() {
                    Image(systemName: "square.stack.3d.up")
                    Text("Hours")
                }
            ViewB()
                .tabItem {
                    Image(systemName: "timer")
                    Text("counter")
                }
            }
        }
        
}

#Preview {
    ContentView()
}
