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
  @State private var leaderboardIsShowing = false
  
  var body: some View {
    VStack {
      HStack {
        Button(action: {
          game.restart()
        }) {
          RoundedImageViewStroked(systemName: "arrow.counterclockwise")
        }
        Spacer()
        Button(action: {
          leaderboardIsShowing = true
        }) {
          RoundedImageViewFilled(systemName: "list.dash")
        }
        .sheet(isPresented: $leaderboardIsShowing, onDismiss: {}, content: {
          LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
        })
      }
    }
  }
}

struct RingsView: View {
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .edgesIgnoringSafeArea(.all)
      
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        let opacity = colorScheme == .dark ? 0.1 : 0.3
        
        Circle()
          .stroke(lineWidth: Constants.General.wideStrokeWidth)
          .fill(RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity), Color("RingsColor").opacity(0)]), center: .center, startRadius: 100, endRadius: 300))
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
        .preferredColorScheme(.dark)
    
    BackgroundView(game: .constant(Game()))
  }
}
