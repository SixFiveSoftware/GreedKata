//
//  Greed.swift
//  GreedKata
//
//  Created by BJ Miller on 1/30/16.
//  Copyright © 2016 Six Five Software, LLC. All rights reserved.
//

import Foundation

struct Greed {
	
	var score: Int = 0
	let roller = Roller()
	var dice = [Int]()
	var scoreKeeper: ScoreKeeperType!
	
	init(scoreKeeper: ScoreKeeperType) {
		self.scoreKeeper = scoreKeeper
	}
	
	mutating func nextRoll() {
		dice = roller.roll()
		score = scoreKeeper.scoreDice(dice: dice)
	}
	
}