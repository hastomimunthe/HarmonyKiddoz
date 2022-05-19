//
//  InstrumentPage.swift
//  HarmonyKidz
//
//  Created by Hastomi Riduan Munthe on 18/05/22.
//

import SwiftUI
import AVFoundation

var soundringtone: AVAudioPlayer?

struct InstrumentPage: View {
    
    func buttonPressed(){
        print("button pressed")

    }

    @State private var swingAngle = -5
    @State private var move = false
    @State private var swingingdrum = false
    @State private var swingingguitar = false
    @State private var swingingxylphone = false
    @State private var swingingkeyboard = false
    @State private var animationdrum = false
    
    var body: some View {
        
        ZStack{
            Image("background room page")
                .resizable()
                .ignoresSafeArea()
            HStack{
        
                    Button( action:{
                        buttonPressed()
                        swingingdrum.toggle()
                    }) {
                        Image("drum")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .offset(x: -150, y: 200)
                            .scaleEffect(0.6)
                            .rotationEffect(.degrees(swingingdrum ? -10 : 10), anchor: swingingdrum ? .bottomLeading : .bottomTrailing)
                            .animation(.easeInOut(duration: 1).repeatCount(swingingdrum ? 14 : 0, autoreverses: true), value: swingingdrum)
                            .onAppear(){
                                soundRingtone()
                            }
                            //.onTapGesture {
                            //swinging.toggle()
                            //}
                    }
                
                    Button( action:{
                        buttonPressed()
                        swingingguitar.toggle()
                    }) {
                        Image("guitar")
                            .resizable()
                            .frame(width: 300, height: 300)
                            .offset(x: -50, y: 280)
                            .scaleEffect(0.6)
                            .rotationEffect(.degrees(swingingguitar ? -10 : 10), anchor: swingingguitar ? .bottomLeading : .bottomTrailing)
                            .animation(.easeInOut(duration: 1).repeatCount(swingingguitar ? 14 : 0, autoreverses: true), value: swingingguitar)
                            //.onTapGesture {
                            //.swinging.toggle()
                            //}
                    }
                
                    Button( action:{
                        buttonPressed()
                        swingingxylphone.toggle()
                    }) {
                    Image("xylophone")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .offset(x: -10, y: 300)
                        .scaleEffect(0.6)
                        .rotationEffect(.degrees(swingingxylphone ? -10 : 10), anchor: swingingxylphone ? .bottomLeading : .bottomTrailing)
                        .animation(.easeInOut(duration: 1).repeatCount(swingingxylphone ? 14 : 0, autoreverses: true), value: swingingxylphone)
                        //.onTapGesture {
                        //.swinging.toggle()
                        //}

                    }
                
                    Button( action:{
                        buttonPressed()
                    swingingkeyboard.toggle()
                    }) {
                    Image("keyboard")
                        .resizable()
                        .frame(width: 220, height: 220)
                        .offset(x: 0, y: -30)
                        .scaleEffect(0.6)
                        .rotationEffect(.degrees(swingingkeyboard ? -10 : 10), anchor: swingingkeyboard ? .bottomLeading : .bottomTrailing)
                        .animation(.easeInOut(duration: 1).repeatCount(swingingkeyboard ? 14 : 0, autoreverses: true), value: swingingkeyboard)
                        //.onTapGesture {
                        //.swinging.toggle()
                        //}
                    }
                }
            
        } .navigationBarHidden(true)
    }
}


func soundRingtone(){
    let path = Bundle.main.path(forResource: "BTS", ofType: "mp3")!
    let url = URL(fileURLWithPath: path)
    do{
        try soundringtone = AVAudioPlayer(contentsOf: url)
    } catch{}
    soundringtone?.numberOfLoops = -1
    soundringtone?.play()
}



struct InstrumentPage_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

