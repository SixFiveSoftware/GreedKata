//
//  RollerTests.swift
//  GreedKataTests
//
//  Created by BJ Miller on 1/30/16.
//  Copyright © 2016 Six Five Software, LLC. All rights reserved.
//

import XCTest
@testable import GreedKata

class RollerTests: XCTestCase {
    
	var roller: Roller!
	
	override func setUp() {
		super.setUp()
		
		roller = Roller()
	}
	
	func test_RollerRollingDice_ReturnsArrayOf5Ints() {
		//given
		let expected = 5

		// when
		let items = roller.roll()
		
		// then
		XCTAssertEqual(items.count, expected)
	}
	
	func testRollerRolesValidValues() {
		let expectedValues = [1,2,3,4,5,6]
		
		let items = roller.roll()
		
		XCTAssertTrue(expectedValues.contains(items[0]))
		XCTAssertTrue(expectedValues.contains(items[1]))
		XCTAssertTrue(expectedValues.contains(items[2]))
		XCTAssertTrue(expectedValues.contains(items[3]))
		XCTAssertTrue(expectedValues.contains(items[4]))
	
	}
	
}
