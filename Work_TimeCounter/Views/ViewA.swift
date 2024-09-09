//
//  ViewA.swift
//  Work_TimeCounter
//
//  Created by Luis Benvenuto on 21/06/24.
//

import SwiftUI

struct ViewA: View {

    @State var amW: Int = 0
    @State var amB: Int = 0
    var body: some View {
        VStack{
            
            Text("Work")
                .font(.system(size: 70, weight: .semibold, design: .rounded))
                .foregroundColor(Color.green)
                .position(CGPoint(x: 200.0, y: 80.0))
           
            SquareCounter(count: "\(amW)")
                .position(x: 200, y:60)
            HStack{
                SquareCounterArrow(icon: "chevron.left"){
                    self.amW -= 1
                }.padding()
                SquareCounterArrow(icon: "chevron.right"){
                    self.amW += 1
                }.padding()
                
            }.position(CGPoint(x: 200.0, y: 30.0))
            
            
            Text("Break")
                .font(.system(size: 70, weight: .semibold, design: .rounded))
                .foregroundColor(Color.green)
                .position(CGPoint(x: 200.0, y: 50.0))
            SquareCounter(count: "\(amB)")
                .position(CGPoint(x: 200.0, y: 30.0))
            HStack{
                SquareCounterArrow(icon: "chevron.left"){
                    amB -= 1
                }.padding()
                SquareCounterArrow(icon: "chevron.right"){
                    amB += 1
                }.padding()
            }.position(CGPoint(x: 200.0, y: 0.0))

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            RadialGradient(
                gradient: Gradient(colors: [Color("Light"), Color.green]),
                center: .center,
                startRadius: 5,
                endRadius: 500
            )
        )
    }
}


#Preview {
    ViewA()
}
