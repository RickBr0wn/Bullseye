//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Rick Brown on 07/01/2021.
//

import SwiftUI

struct LeaderboardView: View {
  var body: some View {
    ZStack {
      Color("BackgrounbdColor")
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 10) {
        HeaderView()
        LabelView()
        RowView(index: 1, score: 60, date: Date())
      }
    }
  }
}

struct HeaderView: View {
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    ZStack {
      HStack {
        if verticalSizeClass == .regular &&
            horizontalSizeClass == .compact {
          BigBoldText(text: "Leaderboard")
            .padding(.leading)
          Spacer()
        } else {
          BigBoldText(text: "Leaderboard")
        }
      }
      HStack {
        Spacer()
        Button(action: {}) {
          RoundedImageViewFilled(systemName: "xmark")
            .padding(.trailing)
        }
      }
    }
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.Leaderboard.leaderboardScoreColumnWidth)
      LabelText(text: "Time")
        .frame(width: Constants.Leaderboard.leaderboardDateColumnWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxiumRowWidth)
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.leaderboardScoreColumnWidth)
      DateText(date: date)
        .frame(width: Constants.Leaderboard.leaderboardDateColumnWidth)
    }
    .background(RoundedRectangle(cornerRadius: .infinity)
                  .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth))
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.leaderboardMaxiumRowWidth)
  }
  
}

struct LeaderboardView_Previews: PreviewProvider {
  static var previews: some View {
    LeaderboardView()
    
    LeaderboardView()
      .previewLayout(.fixed(width: Constants.Previews.previewLandscapeWidth, height: Constants.Previews.previewLandscapeHeight))
      .padding()
    
    LeaderboardView()
      .preferredColorScheme(.dark)
    
    LeaderboardView()
      .preferredColorScheme(.dark)
      .previewLayout(.fixed(width: Constants.Previews.previewLandscapeWidth, height: Constants.Previews.previewLandscapeHeight))
      .padding()
  }
}
