//
//  Game.swift
//  Bullseye
//
//  Created by Rick Brown on 03/01/2021.
//

import Foundation

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

struct Game {
  var target: Int = Int.random(in: 1...100)
  var score: Int = 0
  var round: Int = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(score: 56, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 82, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 562, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
    }
  }
  
  func points(sliderValue: Int) -> Int {
    let difference = abs(target - sliderValue)
    let bonus: Int
    
    if difference == 0 {
      bonus = 100
    } else if difference <= 2 {
      bonus = 50
    } else {
      bonus = 0
    }
    return 100 - difference + bonus
  }
  
  mutating func addToLeaderboard(points: Int) {
    leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
    leaderboardEntries.sort { $0.score > $1.score }
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
  
  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in: 1...100)
    addToLeaderboard(points: points)
  }
}
