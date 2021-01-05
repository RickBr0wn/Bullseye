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
        InstructionsView(game: $game)
        
        SliderView(sliderValue: $sliderValue)
        
        HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
      }
    }
  }
}

struct HitMeButtonView: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
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
    .overlay(RoundedRectangle(cornerRadius: 21.0)
              .strokeBorder(Color.white, lineWidth: 2.0))
    .alert(isPresented: $alertIsVisible, content: {
      let roundedValue: Int = Int(self.sliderValue.rounded())
      
      return Alert(
        title: Text("X"),
        message: Text("The rounded value is \(roundedValue).\nYou scored \(self.game.points(sliderValue: roundedValue)) points this round"),
        dismissButton: .default(Text("close".uppercased())))
    })
  }
}

struct InstructionsView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "Put the bullseye as close as you can to")
        .padding(.leading, 30.0)
        .padding(.trailing, 30.0)
      
      BigNumberText(number: game.target)
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    
    ContentView()
      .previewLayout(.fixed(width: 568, height: 320))
      .padding()
    
    ContentView()
      .preferredColorScheme(.dark)
    
    ContentView()
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: 568, height: 320))
      .padding()
  }
}
