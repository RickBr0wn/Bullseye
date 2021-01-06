//
//  Game.swift
//  Bullseye
//
//  Created by Rick Brown on 03/01/2021.
//

import Foundation

struct Game {
  var target: Int = Int.random(in: 1...100)
  var score: Int = 0
  var round: Int = 1
  
  func points(sliderValue: Int) -> Int {
    var points: Int = 100
    
    if self.target == sliderValue {
      points += 100
    }
    
    if  self.target + 1 == sliderValue ||
        self.target - 1 == sliderValue ||
        self.target + 2 == sliderValue ||
        self.target - 2 == sliderValue
    {
      points += 50
    }
    
    return points - abs(self.target - sliderValue)
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
  }
}
