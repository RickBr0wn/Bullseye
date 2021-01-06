//
//  ContentView.swift
//  Bullseye
//
//  Created by Rick Brown on 03/01/2021.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var sliderValue: Double = 50.0
  @State private var game: Game = Game()
  
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      
      VStack {
        InstructionsView(game: $game)
          .padding(.bottom, alertIsVisible ? .zero : 100)
        
        if alertIsVisible {
          PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        } else {
          HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            .transition(.scale)
        }
      }
      
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .transition(.scale)
      }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    
    ContentView()
      .previewLayout(.fixed(width: Constants.Previews.previewLandscapeWidth, height: Constants.Previews.previewLandscapeHeight))
      .padding()
    
    ContentView()
      .preferredColorScheme(.dark)
    
    ContentView()
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: Constants.Previews.previewLandscapeWidth, height: Constants.Previews.previewLandscapeHeight))
      .padding()
  }
}
