//
//  Parser.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 14/10/2015.
//  Copyright © 2015 Alexandru Clapa. All rights reserved.
//

import Foundation
import CoreData
import SWXMLHash

class Parser {

	func formatDate(_ dateString: String, format: String) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = format
		let date = dateFormatter.date(from: dateString) as Date!
		dateFormatter.dateStyle = DateFormatter.Style.short
		dateFormatter.timeStyle = .short
		let toReturn = dateFormatter.string(from: date!)

		return toReturn
	}

	func parseBNRRates(_ xmlToParse: Data) -> [Currency] {
		var toReturn = [Currency]()

		let xml = SWXMLHash.parse(xmlToParse)

		if let fullNames = PersistanceHelper.fetchFullNames() {
			let currencyCodes = fullNames.keys
			let cubes = xml["DataSet"]["Body"]["Cube"]

			for code in currencyCodes {

				for cube in cubes {

					let date = cubes.element?.allAttributes["date"]?.text

					for rate in cube["Rate"] where rate.element?.allAttributes["currency"]?.text == code {
						let currency: Currency = Currency()
						currency.date = date
						currency.code = code
						currency.fullName = fullNames["code"]

						let value = rate.element?.text!
						currency.conversionRate = value

						if let multiplier = rate.element?.allAttributes["multiplier"]?.text {
							currency.multiplier = multiplier
						}

						toReturn.append(currency)

						break
					}
				}
			}
		}

		return toReturn
	}
}
