//
//  ContentView.swift
//  FlagSmash
//
//  Created by Atin Agnihotri on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
//            Color.accentColor.frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Color(red: 1, green: 0.8, blue: 0.5).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .top, endPoint: .bottom).opacity(0.6).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            RadialGradient(gradient: Gradient(colors: [Color.orange, Color(red: 1, green: 1, blue: 1)]), center: .top, startRadius: 20, endRadius: 200).opacity(0.6).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            AngularGradient(gradient: Gradient(colors: [Color.purple, Color.blue, Color.green, Color.yellow, Color.orange, Color.red]), center: .bottom ).opacity(0.5).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                HStack {
                    Text("1").padding()
                    Text("2").padding()
                    Text("3").padding()
                }
                HStack {
                    Text("4").padding()
                    Text("5").padding()
                    Text("6").padding()
                }
                HStack {
                    Text("7").padding()
                    Text("8").padding()
                    Text("9").padding()
                }
                Button(action: {
                    self.showingAlert = true
                }) {
                    HStack (spacing: 10){
                        Image(systemName: "pencil.tip")
                            .renderingMode(.original)
                            .padding()
                        Text("Tap Me")
                            .padding()
                    }
                }
                	.border(Color.black, width: 1)
                .alert(isPresented: $showingAlert, content: {
                    Alert(title: Text("Hello, SwiftUI"), message: Text("This is some detail message"), dismissButton: .default(Text("Okay")))
                })
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
