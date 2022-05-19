//
//  ContentView.swift
//  HarmonyKidz
//
//  Created by Hastomi Riduan Munthe on 18/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isActive: Bool = false
    var body: some View {
        
    NavigationView {
        ZStack{
            Image("background home page")
                .resizable()
                .ignoresSafeArea()
            VStack{
                NavigationLink(destination: InstrumentPage(), isActive: self.$isActive) {
                    Text("")
                }
                Button(action:{
                    self.isActive = true
                }) {
                    Image("startbutton")
                }
                }
                  .offset(x: 0, y: -100)
            }
        
            } .navigationViewStyle(.stack)
            
            

        }
    }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

