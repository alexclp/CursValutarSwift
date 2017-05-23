//
//  ExchangeRate.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 30/03/2016.
//  Copyright © 2016 Alexandru Clapa. All rights reserved.
//

import Foundation

class ExchangeRate {
	var buyRate: String?
	var sellRate: String?

	public var description: String {
		return "Buy: \(buyRate ?? "N/A"), Sell: \(sellRate ?? "N/A")"
	}
}
