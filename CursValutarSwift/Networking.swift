//
//  Networking.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 14/10/2015.
//  Copyright © 2015 Alexandru Clapa. All rights reserved.
//

import Foundation
import Alamofire
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}


class Networking {
	
	let parser = Parser()

	func getBNRRates(_ completionClosure: @escaping (_ success: Bool, _ parsed: [Currency]?) ->()) {
		Alamofire.request("http://www.bnr.ro/nbrfxrates.xml", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
			.validate() .responseString() { response in
				if let dataToParse = response.data {
					
					var parsedData: [Currency] = self.parser.parseBNRRates(dataToParse)
					parsedData.sort(by: { (a, b) -> Bool in
						a.code < b.code
					})
					
					completionClosure(true, parsedData)
					
				} else {
					print("Error getting Rates XML file")
					
					completionClosure(false, nil)
				}
		}
	}
}
