//
//  ParserTests.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 22/05/2017.
//  Copyright © 2017 Alexandru Clapa. All rights reserved.
//

import XCTest
@testable import CursValutarSwift

class ParserTests: XCTestCase {
	var dataToParse = Data()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		if let filepath = Bundle(for: type(of: self)).path(forResource: "XMLBNR", ofType: "xml") {
			do {
				let contents = try String(contentsOfFile: filepath)
				if let data = contents.data(using: .utf8) {
					dataToParse = data
				}
			} catch {
				print("XML contents could not be loaded")
			}
		} else {
			print("Wrong xml file name!")
		}
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	func testParseBNRRatesShouldReturnArrayOfCurrency() {
		let currencyArray = Parser.shared.parseBNRRates(dataToParse) as [Currency]
		XCTAssertNotNil(currencyArray)
		XCTAssert(currencyArray.count > 0)

		let first = currencyArray[0]
		XCTAssertNotNil(first)
		XCTAssertNotNil(first.date)
		XCTAssertNotNil(first.date)
		XCTAssertNotNil(first.conversionRate)
	}
}
