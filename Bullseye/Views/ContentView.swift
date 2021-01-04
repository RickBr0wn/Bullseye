//
//  ContentView.swift
//  Bullseye
//
//  Created by Rick Brown on 03/01/2021.
//

import SwiftUI

func random(min: Int, max: Int) -> Int {
  return Int.random(in: min...max)
}

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var sliderValue: Double = 50.0
  @State private var game: Game = Game()
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        Text("🎯🎯🎯")
          .font(.largeTitle)
        
        Text("Put the bullseye as close as you can to".uppercased())
          .bold()
          .kerning(2.0)
          .multilineTextAlignment(.center)
          .lineSpacing(4)
          .font(.callout)
        
        Text("\(game.target)")
          .font(.largeTitle)
          .fontWeight(.black)
          .kerning(-1.0)
        
        HStack {
          Text("1")
            .bold()
          
          Slider(value: self.$sliderValue, in: 1.0...100.0)
          
          Text("100")
            .bold()
        }
        .padding()
        
        Button(action: {
          self.alertIsVisible = true
        }) {
          Text("hit me".uppercased())
            .bold()
            .font(.title)
        }
        .padding(20)
        .background(ZStack {
          Color("ButtonColor")
          LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
        })
        .foregroundColor(Color.white)
        .cornerRadius(21.0)
        .alert(isPresented: $alertIsVisible, content: {
          let roundedValue: Int = Int(self.sliderValue.rounded())
          
          return Alert(
            title: Text("X"),
            message: Text("The rounded value is \(roundedValue).\nYou scored \(self.game.points(sliderValue: roundedValue)) points this round"),
            dismissButton: .default(Text("close".uppercased())))
        })
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
      .padding()
  }
}
