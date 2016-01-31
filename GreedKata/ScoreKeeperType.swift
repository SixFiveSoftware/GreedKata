//
//  ScoreKeeperType.swift
//  GreedKata
//
//  Created by BJ Miller on 1/30/16.
//  Copyright © 2016 Six Five Software, LLC. All rights reserved.
//

protocol ScoreKeeperType {
	func scoreDice(dice diceArr: [Int]) -> Int
}

extension ScoreKeeperType {
	func scoreDice(dice diceArr: [Int]) -> Int { return 0 }
}


