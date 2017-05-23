//
//  PersistanceHelperTests.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 22/05/2017.
//  Copyright © 2017 Alexandru Clapa. All rights reserved.
//

import XCTest
@testable import CursValutarSwift

class PersistanceHelperTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

	func testFetchFullNamesShouldReturnADictionaryOfCurrencyCodeAndFullName() {
		if let namesDict = PersistanceHelper.fetchFullNames() {
			XCTAssertTrue(namesDict.keys.count == 31)
			XCTAssertTrue(namesDict["USD"] == "Dolarul american")
		} else {
			XCTFail("Failed to fetch names from the file")
		}
	}
}
