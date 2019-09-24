//
//  ContentView.swift
//  ChoosingTheRightCustomTimingFunctionsForYourSwiftUIAnimation
//
//  Created by ramil on 24/09/2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var rotateHexagon = false
    @State var scaleCircle = false
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 200, height: 200)
                .foregroundColor(scaleCircle ? .yellow : .orange)
                .scaleEffect(scaleCircle ? 1 : 0)
                .animation(Animation.easeInOut(duration: 1).repeatForever().delay(2))
                .onAppear() {
                    self.scaleCircle.toggle()
            }
            
            Image("hexagon")
            .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(rotateHexagon ? 0 : -60), anchor: .center)
                .frame(width: 100, height: 100)
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false))
                .onAppear() {
                    self.rotateHexagon.toggle()
            }
        }
        
        // Text("Waiting for next activity to begin...")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
