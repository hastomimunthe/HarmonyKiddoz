//
//  ContentView.swift
//  HarmonyKidz
//
//  Created by Hastomi Riduan Munthe on 18/05/22.
//

import SwiftUI
import AVFoundation

var audioPlayer : AVAudioPlayer?

func playSound(sound: String, type: String){
        if let path = Bundle.main.path(forResource: sound, ofType: type){
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
                audioPlayer?.numberOfLoops = -1
                print("main")
            } catch {
                print("wadaw")
            }
        }
}

struct MainPageView: View {
    
    @State private var isActive: Bool = false
    var body: some View {
        
    NavigationView {
        ZStack{
            Image("background home page")
                .resizable()
                .ignoresSafeArea()
            VStack{
                NavigationLink(destination: ClassroomPage(), isActive: self.$isActive) {
                    Text("")
                }
                Button(action:{
                    self.isActive = true
                    audioPlayer?.stop()
                    
                    
                }) {
                    Image("startbutton")
                }
                    
                
                }
                  .offset(x: 0, y: -100)
            }
        
            } .navigationViewStyle(.stack)
            .navigationBarHidden(true)
            .onAppear {
                playSound(sound: "introsound", type:"mp3")
            }
            
        
        }
    }
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
            .previewInterfaceOrientation(.landscapeLeft)
        ClassroomPage()
            .previewInterfaceOrientation(.landscapeLeft)
        BackyardPage()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

