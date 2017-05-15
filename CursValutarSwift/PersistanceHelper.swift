//
//  PersistanceHelper.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 30/03/2016.
//  Copyright © 2016 Alexandru Clapa. All rights reserved.
//

import Foundation

class PersistanceHelper {
	
	class func fetchFullNames() -> [String: String] {
		var dict: NSDictionary?
		if let path = Bundle.main.path(forResource: "RatesFullNames", ofType: "plist") {
			dict = NSDictionary(contentsOfFile: path)
		}
		
		return dict as! [String: String]
	}
}
