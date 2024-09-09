//
//  SquareCounter.swift
//  Work_TimeCounter
//
//  Created by Luis Benvenuto on 21/06/24.
//

import SwiftUI

struct SquareCounterArrow: View {
    let icon: String
    let action: () -> Void
    
    var body: some View {
            Button{
                action()
            }label: {
                Image(systemName: icon)
                    .foregroundColor(Color("Light"))
                    .frame(width: 60, height: 60)
                    .background(Color.green).opacity(0.8)
                    .clipShape(Circle())
            }
    }
}

#Preview {
    SquareCounterArrow(icon: "chevron.right"){
        print("hello")
    }
}
