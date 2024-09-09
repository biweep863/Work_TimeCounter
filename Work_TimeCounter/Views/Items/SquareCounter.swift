//
//  SquareCountre.swift
//  Work_TimeCounter
//
//  Created by Luis Benvenuto on 24/06/24.
//

import SwiftUI

struct SquareCounter: View {
    var count: String
  
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.green)
                .opacity(0.5)
                .frame(width: 150,height: 100)
            Text(count)
                .font(.system(size: 70, weight: .semibold, design: .rounded))
                .foregroundColor(Color("Light"))
        }
        
    }
}

#Preview {
    SquareCounter(count: "3")
}
