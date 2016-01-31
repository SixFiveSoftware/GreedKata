//
//  Roller.swift
//  GreedKata
//
//  Created by BJ Miller on 1/30/16.
//  Copyright © 2016 Six Five Software, LLC. All rights reserved.
//

import Foundation

struct Roller {
	
	
	func roll() -> [Int] {
		var rolls = [Int]()
		for _ in 1...5 {
			let diceRoll = Int(arc4random_uniform(6) + 1)
			rolls.append(diceRoll)
		}
		
		return rolls
	}
}
