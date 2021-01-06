//
//  PointsView.swift
//  Bullseye
//
//  Created by Rick Brown on 06/01/2021.
//

import SwiftUI

struct PointsView: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    
    VStack(spacing: 10) {
      InstructionText(text: "The sliders value is")
      BigNumberText(number: roundedValue)
      BodyText(text: "You scored \(points) points\n🎉🎉🎉")
      Button(action: {
        withAnimation {
          alertIsVisible = false
        }
        game.startNewRound(points: points)
      }) {
        ButtonText(text: "Start new round")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .shadow(radius: 10, x: 5, y: 5)
    .transition(.scale)
  }
}

struct PointsView_Previews: PreviewProvider {
  static private var alertIsVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(51.0)
  static private var game = Binding.constant(Game())
  
  static var previews: some View {
    Group {
      PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
      
      PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        .previewLayout(.fixed(width: Constants.Previews.previewLandscapeWidth, height: Constants.Previews.previewLandscapeHeight))
        .padding()
      
      PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        .preferredColorScheme(.dark)
      
      PointsView(alertIsVisible: alertIsVisible, sliderValue: sliderValue, game: game)
        .preferredColorScheme(.dark)
        .previewLayout(.fixed(width: Constants.Previews.previewLandscapeWidth, height: Constants.Previews.previewLandscapeHeight))
        .padding()

    }
  }
}
