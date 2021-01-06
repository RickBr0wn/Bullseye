//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Rick Brown on 05/01/2021.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingsView()
    )
  }
}

struct NumberView: View {
  var title: String
  var number: Int
  
  var body: some View {
    VStack {
      LabelText(text: title)
      RoundRectTextView(number: number)
    }
  }
}

struct TopView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      HStack {
        Button(action: {
          game.restart()
        }) {
          RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        }
        Spacer()
        RoundedImageViewFilled(systemName: "list.dash")
      }
    }
  }
}

struct RingsView: View {
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        Circle()
          .stroke(lineWidth: 20.0)
          .fill(RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(0.3 * 0.8), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300))
          .frame(width: size, height: size)
      }
    }
  }
}

struct BottomView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      HStack {
        NumberView(title: "Score".uppercased(), number: game.score)
        Spacer()
        NumberView(title: "Round".uppercased(), number: game.round)
      }
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
