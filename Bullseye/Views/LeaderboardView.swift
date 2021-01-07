//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Rick Brown on 07/01/2021.
//

import SwiftUI

struct LeaderboardView: View {
  var body: some View {
    RowView(index: 1, score: 60, date: Date())
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.leaderboardScoreColumnWidth)
      DateText(date: date)
        .frame(width: Constants.Leaderboard.leaderboardDateColumnWidth)
    }
    .background(RoundedRectangle(cornerRadius: .infinity)
                  .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth))
    .padding(.horizontal)
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
