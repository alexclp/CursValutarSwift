//
//  PersistanceHelper.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 30/03/2016.
//  Copyright © 2016 Alexandru Clapa. All rights reserved.
//

import Foundation

class PersistanceHelper {
	class func fetchFullNames() -> [String: String]? {
		if let path = Bundle(for: self).path(forResource: "RatesFullNames", ofType: "plist") {
			if let dic = NSDictionary(contentsOfFile: path) as? [String: String] {
				return dic
			}
		}
		return nil
	}
}
