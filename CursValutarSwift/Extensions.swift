//
//  Extensions.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 19/05/2017.
//  Copyright © 2017 Alexandru Clapa. All rights reserved.
//

import UIKit

extension UIColor {
	class func hexStringToUIColor(hex: String) -> UIColor {
		var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

		if cString.hasPrefix("#") {
			cString.remove(at: cString.startIndex)
		}

		if (cString.characters.count) != 6 {
			return UIColor.gray
		}

		var rgbValue: UInt32 = 0
		Scanner(string: cString).scanHexInt32(&rgbValue)

		return UIColor(
			red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
			green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
			blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
			alpha: CGFloat(1.0)
		)
	}
}

extension Date {
	static func formatDate(_ dateString: String, format: String) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = format
		let date = dateFormatter.date(from: dateString) as Date!
		dateFormatter.dateStyle = DateFormatter.Style.short
		dateFormatter.timeStyle = .short
		let toReturn = dateFormatter.string(from: date!)

		return toReturn
	}
}
