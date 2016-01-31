//
//  GreedKataTests.swift
//  GreedKataTests
//
//  Created by BJ Miller on 1/30/16.
//  Copyright © 2016 Six Five Software, LLC. All rights reserved.
//

import XCTest
@testable import GreedKata

class GreedKataTests: XCTestCase {
	
	class MockScoreKeeper: ScoreKeeper {
		private (set) var scoreDiceWasCalled = false
		var testDice = [Int]()
		override func scoreDice(dice diceArr: [Int]) -> Int {
			scoreDiceWasCalled = true
			return super.scoreDice(dice: testDice)
		}
	}
	
	var greed: Greed!
	var mockScoreKeeper: MockScoreKeeper!
	
	override func setUp() {
		super.setUp()
		
		mockScoreKeeper = MockScoreKeeper()
	}
	
	func test_GreedObject_HasScoreStartingAtZero() {
		// given
		
		// when
		greed = Greed(scoreKeeper: mockScoreKeeper)
		
		// then
		XCTAssertEqual(greed.score, 0)
	}
	
	func test_GreedObject_HasDiceRollTracker() {
		// given
		let expected = 5
		greed = Greed(scoreKeeper: mockScoreKeeper)
		
		// when
		greed.nextRoll()
		
		// then
		XCTAssertEqual(greed.dice.count, expected)
	}
	
	func test_GreedObject_CallsScoreKeeper_WhenCallingNextRoll() {
		// given
		greed = Greed(scoreKeeper: mockScoreKeeper)
		
		// when
		greed.nextRoll()
		
		// then
		XCTAssertTrue(mockScoreKeeper.scoreDiceWasCalled)
	}
	
	func test_GreedObject_CanScoreASingle1As100Points() {
		// given
		let expectedScore = 100
		let testDice = [1]
		mockScoreKeeper.testDice = testDice
		greed = Greed(scoreKeeper: mockScoreKeeper)
		
		// when
		greed.nextRoll()
		
		// then
		XCTAssertEqual(greed.score, expectedScore)
	}
	
	func test_GreedObject_CanScoreDoubleOnesAs200Points() {
		// given
		let expectedScore = 200
		let testDice = [1,1]
		mockScoreKeeper.testDice = testDice
		greed = Greed(scoreKeeper: mockScoreKeeper)
		
		// when
		greed.nextRoll()
		
		// then
		XCTAssertEqual(greed.score, expectedScore)
	}
	
	func test_GreedObject_CanScoreThreeOnesAs1000Points() {
		// given
		let expectedScore = 1000
		let testDice = [1,1,1]
		mockScoreKeeper.testDice = testDice
		greed = Greed(scoreKeeper: mockScoreKeeper)
		
		// when
		greed.nextRoll()
		
		// then
		XCTAssertEqual(greed.score, expectedScore)
	}
	
	func test_GreedObject_CanScore11151As1150Points() {
		let expectedScore = 1150
		let testDice = [1,1,1,5,1]
		mockScoreKeeper.testDice = testDice
		greed = Greed(scoreKeeper: mockScoreKeeper)
		
		// when
		greed.nextRoll()
		
		// then
		XCTAssertEqual(greed.score, expectedScore)
	}
	
	func test_GreedObject_CanScore23462As0Points() {
		let expectedScore = 0
		let testDice = [2,3,4,6,2]
		mockScoreKeeper.testDice = testDice
		greed = Greed(scoreKeeper: mockScoreKeeper)
		
		// when
		greed.nextRoll()
		
		// then
		XCTAssertEqual(greed.score, expectedScore)
	}
	
	func test_GreedObject_CanScore34533As350Points() {
		let expectedScore = 350
		let testDice = [3,4,5,3,3]
		mockScoreKeeper.testDice = testDice
		greed = Greed(scoreKeeper: mockScoreKeeper)
		
		// when
		greed.nextRoll()
		
		// then
		XCTAssertEqual(greed.score, expectedScore)
	}
    
}
