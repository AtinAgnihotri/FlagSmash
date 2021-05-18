//
//  ContentView.swift
//  FlagSmash
//
//  Created by Atin Agnihotri on 17/05/21.
//

import SwiftUI

struct ContentView: View {

    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Russia", "Spain", "UK", "US"].shuffled()
    var correctAns = Int.random(in: 0...2)
    @State private var showingScore = false
    
    var body: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            VStack (spacing: 30){
                Spacer()
                VStack{
                    Text("Tap the flag of: ")
                        .font(.title)
                        .foregroundColor(.white)
                    Text(countries[correctAns])
                        .font(.title)
                        .foregroundColor(.white)
                }
                Spacer()
                ForEach(0..<3) { number in
                    Button(action: {
                        checkAnswer(userAns: number)
                    }) {
                       Image(countries[number])
                    }
                }
                Spacer()
                
            }
        }
    }
    
    func checkAnswer(userAns: Int) {
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
