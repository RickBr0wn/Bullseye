//
//  BullseyeTests.swift
//  BullseyeTests
//
//  Created by Rick Brown on 03/01/2021.
//

import XCTest
@testable import Bullseye

class BullseyeTests: XCTestCase {
  var game: Game!
  
  override func setUpWithError() throws {
    game = Game()
  }
  
  override func tearDownWithError() throws {
    game = nil
  }
  
  func testScorePositive() {
    let guess = game.target + 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
 
  func testScoreNegative() {
    let guess = game.target - 5
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 95)
  }
  
  func testScorePerfect() {
    let guess = game.target
    let score = game.points(sliderValue: guess)
    XCTAssertEqual(score, 100)
  }
}
