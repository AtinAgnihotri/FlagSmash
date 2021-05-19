//
//  ContentView.swift
//  FlagSmash
//
//  Created by Atin Agnihotri on 17/05/21.
//

import SwiftUI

struct ContentView: View {

    @State private var userScore = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAns = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var lastCountry: String {
        countries[correctAns]
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack (spacing: 30){
                Spacer()
                VStack{
                    Text("Tap the flag of: ")
                        .font(.title)
                        .foregroundColor(.white)
                    Text(countries[correctAns])
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .foregroundColor(.white)
                }
                Spacer()
                ForEach(0..<3) { number in
                    Button(action: {
                        checkAnswer(number)
                    }) {
                       Image(countries[number])
                    }
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.black, lineWidth: 3))
                    .shadow(color: .black, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                }
                Spacer()
                Spacer()
                
            }
        }.alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(userScore)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func checkAnswer(_ userAns: Int) {
        if userAns == correctAns {
            scoreTitle = "Correct"
            userScore += 1
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        let lastCountry = countries[correctAns]
        countries.shuffle()
        // So that the next country is not the same as the last one
        repeat {
            correctAns = Int.random(in: 0...2)
            print("Running loop")
        } while lastCountry == countries[correctAns]
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
