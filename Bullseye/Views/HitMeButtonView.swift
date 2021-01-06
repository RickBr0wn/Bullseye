//
//  HitMeButtonView.swift
//  Bullseye
//
//  Created by Rick Brown on 05/01/2021.
//

import SwiftUI

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
      let points = self.game.points(sliderValue: roundedValue)
      
      return Alert(
        title: Text("X"),
        message: Text("The rounded value is \(roundedValue).\nYou scored \(points) points this round"),
        dismissButton: .default(Text("close".uppercased())) {
          game.startNewRound(points: points)
        }
      )
    })
  }
}

struct HitMeButtonView_Previews: PreviewProvider {
    static var previews: some View {
      HitMeButtonView(alertIsVisible: .constant(false), sliderValue: .constant(50.0), game: .constant(Game()))
    }
}