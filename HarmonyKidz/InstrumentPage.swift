//
//  InstrumentPage.swift
//  HarmonyKidz
//
//  Created by Hastomi Riduan Munthe on 18/05/22.
//

import SwiftUI

struct InstrumentPage: View {
    
    func buttonPressed(){
        swinging.toggle()
        print("button pressed")

    }

    @State private var swingAngle = -5
    @State private var move = false
    @State private var swinging = false
    
    var body: some View {
        
        ZStack{
            Image("background room page")
                .resizable()
                .ignoresSafeArea()
            HStack{
        
                    Button( action:{
                        buttonPressed()
                        swinging.toggle()
                    }) {
                        Image("drum")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .offset(x: -150, y: 200)
                            .scaleEffect(0.6)
                            .rotationEffect(.degrees(swinging ? -10 : 10), anchor: swinging ? .bottomLeading : .bottomTrailing)
                            .animation(.easeInOut(duration: 1).repeatCount(14, autoreverses: true), value: swinging)
                            //.onTapGesture {
                            //swinging.toggle()
                            //}
                    }
                
                    Button( action:{
                        buttonPressed()
                        swinging.toggle()
                    }) {
                        Image("guitar")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .offset(x: -50, y: 280)
                            .scaleEffect(0.6)
                            .rotationEffect(.degrees(swinging ? -10 : 10), anchor: swinging ? .bottomLeading : .bottomTrailing)
                            .animation(.easeInOut(duration: 1).repeatCount(14, autoreverses: true), value: swinging)
                            //.onTapGesture {
                            //.swinging.toggle()
                            //}
                    }
                
                    Button( action:{
                        buttonPressed()
                        swinging.toggle()
                    }) {
                    Image("xylophone")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .offset(x: -10, y: 300)
                        .scaleEffect(0.6)
                        .rotationEffect(.degrees(swinging ? -10 : 10), anchor: swinging ? .bottomLeading : .bottomTrailing)
                        .animation(.easeInOut(duration: 1).repeatCount(14, autoreverses: true), value: swinging)
                        //.onTapGesture {
                        //.swinging.toggle()
                        //}

                    }
                
                    Button( action:{
                        buttonPressed()
                    swinging.toggle()
                    }) {
                    Image("keyboard")
                        .resizable()
                        .frame(width: 220, height: 220)
                        .offset(x: 0, y: -30)
                        .scaleEffect(0.6)
                        .rotationEffect(.degrees(swinging ? -10 : 10), anchor: swinging ? .bottomLeading : .bottomTrailing)
                        .animation(.easeInOut(duration: 1).repeatCount(14, autoreverses: true), value: swinging)
                        //.onTapGesture {
                        //.swinging.toggle()
                        //}
                    }
                }
            
        } .navigationBarHidden(true)
    }
}



struct InstrumentPage_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

