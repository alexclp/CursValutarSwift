//
//  Networking.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 14/10/2015.
//  Copyright © 2015 Alexandru Clapa. All rights reserved.
//

import Foundation
import Alamofire

private func < <T: Comparable>(lhs: T?, rhs: T?) -> Bool {
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
	func getBNRRates(_ completionClosure: @escaping (_ success: Bool, _ parsed: [Currency]?) -> Void) {
		Alamofire.request("http://www.bnr.ro/nbrfxrates.xml", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
			.validate() .responseString { response in
				if let dataToParse = response.data {
					var parsedData = Parser.shared.parseBNRRates(dataToParse) as [Currency]
					parsedData.sort(by: { (first, second) -> Bool in
						first.code < second.code
					})

					completionClosure(true, parsedData)
				} else {
					print("Error getting Rates XML file")
					completionClosure(false, nil)
				}
		}
	}
}
