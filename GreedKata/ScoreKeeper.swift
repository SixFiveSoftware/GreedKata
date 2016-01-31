//
//  ScoreKeeper.swift
//  GreedKata
//
//  Created by BJ Miller on 1/30/16.
//  Copyright © 2016 Six Five Software, LLC. All rights reserved.
//

class ScoreKeeper : ScoreKeeperType {
	let values: [Int : Int] = [11: 100, 12: 200, 13: 1000, 14: 1100, 15: 1200, 23: 200, 33: 300, 43: 400, 51: 50, 52: 100, 53: 500, 54: 550, 55: 600, 63: 600]

	func scoreDice(dice diceArr: [Int]) -> Int {
		var totalScore = 0
		
		var rolls : [Int : Int] = [:]
		for die in diceArr {
			if var value = rolls[die] {
				value += 1
				rolls[die] = value
			} else {
				rolls[die] = 1
			}
		}
		
		for (roll, number) in rolls {
			let key = roll * 10 + number
			if let score = values[key] {
				totalScore += score
			}
		}
		
		return totalScore
	}

}
