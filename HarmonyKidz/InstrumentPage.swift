//
//  InstrumentPage.swift
//  HarmonyKidz
//
//  Created by Hastomi Riduan Munthe on 18/05/22.
//

import SwiftUI
import AVFoundation


var audioPlayerGuitar : AVAudioPlayer?

func playSoundGuitar(sound: String, type: String){
    if audioPlayerGuitar != nil {
        audioPlayerGuitar = nil
    } else {
        if let path = Bundle.main.path(forResource: sound, ofType: type){
            do {
                audioPlayerGuitar = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayerGuitar?.play()
                audioPlayerGuitar?.numberOfLoops = -1
                print("guitar")
            } catch {
                print("wadaw")
            }
        }
    }
}

var audioPlayerDrum : AVAudioPlayer?

func playSoundDrum(sound: String, type: String){
    if audioPlayerDrum != nil {
        audioPlayerDrum = nil
    } else {
        if let path = Bundle.main.path(forResource: sound, ofType: type){
            do {
                audioPlayerDrum = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayerDrum?.play()
                audioPlayerDrum?.numberOfLoops = -1
                print("drum")
            } catch {
                print("wadaw")
            }
        }
    }
}

var audioPlayerKeyboard : AVAudioPlayer?

func playSoundKeyboard(sound: String, type: String){
    if audioPlayerKeyboard != nil {
        audioPlayerKeyboard = nil
    } else {
        if let path = Bundle.main.path(forResource: sound, ofType: type){
            do {
                audioPlayerKeyboard = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayerKeyboard?.play()
                audioPlayerKeyboard?.numberOfLoops = -1
                print("keyboard")
            } catch {
                print("wadaw")
            }
        }
    }
}

var audioPlayerXylophone : AVAudioPlayer?

func playSoundXylophone(sound: String, type: String){
    if audioPlayerXylophone != nil {
        audioPlayerXylophone = nil
    } else {
        if let path = Bundle.main.path(forResource: sound, ofType: type){
            do {
                audioPlayerXylophone = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayerXylophone?.play()
                audioPlayerXylophone?.numberOfLoops = -1
                print("xylophone")
            } catch {
                print("wadaw")
            }
        }
    }
}


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
    @State private var isActive: Bool = false
    
    var body: some View {
        
        ZStack{
            Image("background room page")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            HStack{

                    Button( action:{
                        buttonPressed()
                        playSoundDrum(sound: "Drum", type:"mp3")
                        swingingdrum.toggle()
                    }) {
                        Image("drum")
                            .resizable()
                            .frame(width: 350, height: 350)
                            .offset(x: 290, y: 90)
                            .scaleEffect(0.6)
                            .rotationEffect(.degrees(swingingdrum ? -10 : 10), anchor: swingingdrum ? .bottomLeading : .bottomTrailing)
                            .animation(.easeInOut(duration: 1).repeatCount(swingingdrum ? 14 : 0, autoreverses: true), value: swingingdrum)
                    }
                
                    Button( action:{
                        buttonPressed()
                        swingingguitar.toggle()
                        playSoundGuitar(sound: "Guitar", type:"mp3")
                    }) {
                        Image("guitar")
                            .resizable()
                            .frame(width: 420, height: 450)
                            .offset(x: 10, y: 580)
                            .scaleEffect(0.6)
                            .rotationEffect(.degrees(swingingguitar ? -10 : 10), anchor: swingingguitar ? .bottomLeading : .bottomTrailing)
                            .animation(.easeInOut(duration: 1).repeatCount(swingingguitar ? 14 : 0, autoreverses: true), value: swingingguitar)

                    }
                    Button( action:{
                        buttonPressed()
                        swingingxylphone.toggle()
                        playSoundXylophone(sound: "Xylophone", type:"mp3")
                    }) {
                    Image("xylophone")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .offset(x: 100, y: 650)
                        .scaleEffect(0.6)
                        .rotationEffect(.degrees(swingingxylphone ? -10 : 10), anchor: swingingxylphone ? .bottomLeading : .bottomTrailing)
                        .animation(.easeInOut(duration: 1).repeatCount(swingingxylphone ? 14 : 0, autoreverses: true), value: swingingxylphone)
                    }

                
                    Button( action:{
                        buttonPressed()
                        swingingkeyboard.toggle()
                        playSoundKeyboard(sound: "Keyboard", type:"mp3")
                    }) {
                    Image("keyboard")
                        .resizable()
                        .frame(width: 300, height: 350)
                        .offset(x: -50, y: 350)
                        .scaleEffect(0.6)
                        .rotationEffect(.degrees(swingingkeyboard ? -10 : 10), anchor: swingingkeyboard ? .bottomLeading : .bottomTrailing)
                        .animation(.easeInOut(duration: 1).repeatCount(swingingkeyboard ? 14 : 0, autoreverses: true), value: swingingkeyboard)
                    }
                
                VStack{
                    NavigationLink(destination: BeachPage(), isActive: self.$isActive) {
                        Text("")
                    }
                    Button(action:{
                        self.isActive = true
                    }) {
                        Image("NEXTNEXT")
                    }
                    }
                      .offset(x: -200, y: 400)
                
                
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

