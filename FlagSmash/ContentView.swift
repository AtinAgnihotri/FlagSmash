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
    @State private var ansSelected = false
    @State private var scoreTitle = ""
    @State private var correctRotationDegrees = [0.0, 0.0, 0.0]
    @State private var incorrectRotationDegrees = [0.0, 0.0, 0.0]
    @State private var alertMessage = ""
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
  
                ForEach(0..<3) { number in
                    Button(action: {
                        checkAnswer(number)
                    }) {
                       Image(countries[number])
                        .opacity(ansSelected ? self.correctAns == number ? 1 : 0.75 : 1)
                    }
                    .clipShape(Capsule())
                    .overlay(Capsule().stroke(Color.black, lineWidth: 3))
                    .shadow(color: .black, radius: 10 )
                    .rotation3DEffect(
                        .degrees(self.correctRotationDegrees[number]),
                        axis: (x: 0.0, y: 1.0, z: 0.0)
                    )
                    .rotation3DEffect(
                        .degrees(self.incorrectRotationDegrees[number]),
                        axis: (x: 0.0, y: 0.0, z: 1.0)
                    )
                    
                }
  
                Text("Your Score is \(userScore)").font(.title).foregroundColor(.white)
                Spacer()
                
            }
            .alert(isPresented: $showingScore) {
                Alert(title: Text(scoreTitle), message: Text(alertMessage), dismissButton: .default(Text("Continue")) {
    //                self.askQuestion()
                })
            }
        }
        
    }
    
    func checkAnswer(_ userAns: Int) {
        if userAns == correctAns {
            scoreTitle = "Correct"
            userScore += 1
            withAnimation {
                self.correctRotationDegrees[userAns] += 360
            }
            
        } else {
            scoreTitle = "Wrong"
            showingScore = true
            alertMessage = "That's the map of \(countries[userAns])"
            withAnimation {
                self.incorrectRotationDegrees[userAns] += 360
            }
        }
        
//        showingScore = true
        ansSelected = true
        
        self.askQuestion()
    }
    
    func askQuestion() {
        let lastCountry = countries[correctAns]
        countries.shuffle()
        // So that the next country is not the same as the last one
        repeat {
            correctAns = Int.random(in: 0...2)
            print("Running loop")
        } while lastCountry == countries[correctAns]
        
        ansSelected = false
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
