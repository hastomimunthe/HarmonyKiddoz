//
//  BeachPage.swift
//  HarmonyKidz
//
//  Created by Brenda Nathania Passandaran on 20/05/22.
//

import SwiftUI
import AVFoundation

//wkwk
var audioPlayerViolin : AVAudioPlayer?

func playSoundViolin(sound: String, type: String){
    if audioPlayerViolin != nil {
        audioPlayerViolin = nil
    } else {
        if let path = Bundle.main.path(forResource: sound, ofType: type){
            do {
                audioPlayerViolin = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayerViolin?.play()
                audioPlayerViolin?.numberOfLoops = -1
                print("violin")
            } catch {
                print("wadaw")
            }
        }
    }
}

var audioPlayerTambourine : AVAudioPlayer?

func playSoundTambourine(sound: String, type: String){
    if audioPlayerTambourine != nil {
        audioPlayerTambourine = nil
    } else {
        if let path = Bundle.main.path(forResource: sound, ofType: type){
            do {
                audioPlayerTambourine = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayerTambourine?.play()
                audioPlayerTambourine?.numberOfLoops = -1
                print("tambourine")
            } catch {
                print("wadaw")
            }
        }
    }
}

var audioPlayerHandbells : AVAudioPlayer?

func playSoundHandbells(sound: String, type: String){
    if audioPlayerHandbells != nil {
        audioPlayerHandbells = nil
    } else {
        if let path = Bundle.main.path(forResource: sound, ofType: type){
            do {
                audioPlayerHandbells = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayerHandbells?.play()
                audioPlayerHandbells?.numberOfLoops = -1
                print("handbells")
            } catch {
                print("wadaw")
            }
        }
    }
}

var audioPlayerKalimba : AVAudioPlayer?

func playSoundKalimba(sound: String, type: String){
    if audioPlayerKalimba != nil {
        audioPlayerKalimba = nil
    } else {
        if let path = Bundle.main.path(forResource: sound, ofType: type){
            do {
                audioPlayerKalimba = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayerKalimba?.play()
                audioPlayerKalimba?.numberOfLoops = -1
                print("kalimba")
            } catch {
                print("wadaw")
            }
        }
    }
}

struct BackyardPage: View {
    
    @State private var isContent3Active = false
    @State private var isContent4Active = false
    
    func buttonPressed(){
        print("button pressed")

    }

    @State private var move = false
    @State private var swingingviolin = false
    @State private var swingingtambourine = false
    @State private var swinginghandbells = false
    @State private var swingingkalimba = false
    @State private var isActive: Bool = false
    
    var body: some View {
        NavigationView {
        ZStack{
            Image("background backyard page")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ZStack{
                VStack {
                    Button( action:{
                        buttonPressed()
                        playSoundViolin(sound: "Violin", type:"mp3")
                        swingingviolin.toggle()
                    }) {
                    Image("biola")
                        .resizable()
                        .scaleEffect(0.6)
                        .rotationEffect(.degrees(swingingviolin ? -10 : 10), anchor: swingingviolin ? .bottomLeading : .bottomTrailing)
                        .animation(.easeInOut(duration: 1).repeatCount(swingingviolin ? 30 : 0, autoreverses: true), value: swingingviolin)
                    }
                }   .frame(width: 400, height: 400)
                    .offset(x: -500, y: 300)
                
                VStack {
                    Button( action:{
                        buttonPressed()
                        swingingtambourine.toggle()
                        playSoundGuitar(sound: "Tambourine", type:"mp3")
                    }) {
                    Image("tamborin")
                        .resizable()
                        .scaleEffect(0.6)
                        .rotationEffect(.degrees(swingingtambourine ? -10 : 10), anchor: swingingtambourine ? .bottomLeading : .bottomTrailing)
                        .animation(.easeInOut(duration: 1).repeatCount(swingingtambourine ? 30 : 0, autoreverses: true), value: swingingtambourine)

                    }
                }   .frame(width: 400, height: 400)
                    .offset(x: -190, y: 100)
                
                VStack{
                    Button( action:{
                        buttonPressed()
                        swinginghandbells.toggle()
                        playSoundHandbells(sound: "Handsbell", type:"mp3")
                    }) {
                    Image("lonceng")
                        .resizable()
                        .scaleEffect(0.6)
                        .rotationEffect(.degrees(swinginghandbells ? -10 : 10), anchor: swinginghandbells ? .bottomLeading : .bottomTrailing)
                        .animation(.easeInOut(duration: 1).repeatCount(swinginghandbells ? 30 : 0, autoreverses: true), value: swinginghandbells)
                    }
                }   .frame(width: 350, height: 350)
                    .offset(x: 450, y: 200)

                
                VStack {
                    Button( action:{
                        buttonPressed()
                        swingingkalimba.toggle()
                        playSoundKeyboard(sound: "Kalimba", type:"mp3")
                    }) {
                    Image("kalimba")
                        .resizable()
                        .rotationEffect(.degrees(swingingkalimba ? -10 : 10), anchor: swingingkalimba ? .bottomLeading : .bottomTrailing)
                        .animation(.easeInOut(duration: 1).repeatCount(swingingkalimba ? 30 : 0, autoreverses: true), value: swingingkalimba)
                    }
                }   .frame(width: 250, height: 250)
                    .offset(x: 160, y: 300)
                
                VStack{
                NavigationLink(destination: MainPageView(), isActive: self.$isContent3Active) {
                        Text("")
                }
                Button(action:{
                    self.isContent3Active = true
                }) {
                    Image("homebutton1")
                    .resizable()
                    }
                }  .frame(width: 120, height: 130)
                      .offset(x: -550, y: -450)
                
                VStack{
                NavigationLink(destination: ClassroomPage(), isActive: self.$isContent4Active) {
                        Text("")
                }
                Button(action:{
                    self.isContent4Active = true
                }) {
                    Image("classroom")
                    .resizable()
                    }
                }  .frame(width: 300, height: 110)
                      .offset(x: 480, y: -450)
            }
            
        }
        } .navigationBarHidden(true)
            .navigationViewStyle(.stack)
    }
}
struct BeachPage_Previews: PreviewProvider {
    static var previews: some View {
        BackyardPage()
            .previewInterfaceOrientation(.landscapeLeft)
        ClassroomPage()
            .previewInterfaceOrientation(.landscapeRight)
        MainPageView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
