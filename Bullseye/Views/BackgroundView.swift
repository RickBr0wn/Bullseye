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
    .background(Color("BackgroundColor").edgesIgnoringSafeArea(.all))
    
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
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        Spacer()
        RoundedImageViewFilled(systemName: "list.dash")
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
