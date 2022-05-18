//
//  InstrumentPage.swift
//  HarmonyKidz
//
//  Created by Hastomi Riduan Munthe on 18/05/22.
//

import SwiftUI

struct InstrumentPage: View {
    func buttonPressed(){
        print("button pressed")
    }
    @State private var swingAngle = -5
    @State private var move = false
    @State private var swinging = false
//    @State private var isDrumClicked = false
    
    var body: some View {
        
        ZStack{
            Image("background room page")
                .resizable()
                .ignoresSafeArea()
            HStack{
                VStack {
                    ZStack {
                        Button( action:{
                            buttonPressed()
//                            isDrumClicked.toggle()
                        }) {
                            Image("drum")
                                .rotation3DEffect(.degrees(Double(swingAngle)), axis: (x: 0.0, y: 1, z: 0.0))
                               // .resizable()
                                .frame(width: 200, height: 200)
                                .offset(x: -30, y: 50)
                                .scaleEffect(0.6)
//                                .rotationEffect(.degrees(swinging ? -10 : 10), anchor: swinging ? .bottomLeading : .bottomTrailing)
                                .offset(y: -15)
//                                .animation(.easeInOut(duration: 1).repeatCount(14, autoreverses: true), value: swinging)
                                .animation(Animation.easeOut(duration: 2).repeatForever(autoreverses: true))
                                .onAppear()
                            {
                                swingAngle = 25
                            }
                            
//                                .rotationEffect(.degrees(90))
                        }
//                        .zIndex(1)
//                        if isDrumClicked {
//                            VStack(spacing: -46) {
//                                Image("drum")
//                                    .offset(y: 20)
//                                    .offset(x: move ? -160 : 160)
//                                    .animation(.linear(duration: 14), value: move)
//                                Image("drum")
//                                    .offset(y: 10)
//                                    .offset(x: move ? -150 : 150)
//                                    .animation(.linear(duration: 14), value: move)
//                                    .task {
//                                        move.toggle()
//                                        swinging.toggle()
//                                    }
//                            }
//                            .mask(Image("wave_top"))
//                        }
                        VStack(spacing: -46) {
                            Image("drum")
                                .offset(y: 20)
                                .offset(x: move ? -160 : 160)
                                .animation(.linear(duration: 14), value: move)
                            Image("drum")
                                .offset(y: 10)
                                .offset(x: move ? -150 : 150)
                                .animation(.linear(duration: 14), value: move)
                                .task {
                                    move.toggle()
                                    swinging.toggle()
                                }
                        }
                        .mask(Image("wave_top"))
                    }
                    .scaleEffect(2)
                }
                
                VStack {
                    Button( action:{
                        buttonPressed()
                    }) {
                        Image("guitar")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .offset(x: -50, y: 280)
                    }
                }
                
                VStack {
                    Image("xylophone")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .offset(x: -10, y: 300)
                }
                VStack {
                    Image("keyboard")
                        .resizable()
                        .frame(width: 220, height: 220)
                        .offset(x: 0, y: -30)
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

