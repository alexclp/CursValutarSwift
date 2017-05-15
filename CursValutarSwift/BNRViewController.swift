//
//  ViewController.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 14/10/2015.
//  Copyright © 2015 Alexandru Clapa. All rights reserved.
//

import UIKit
import CoreData

class BNRViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView?
	var fullNameDictionary = PersistanceHelper.fetchFullNames()
	var selectedIndex: Int = 0
	var networking = Networking()
	
	var bnrrates = [Currency]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Curs BNR"
		
		networking.getBNRRates { (success, parsed) in
			if success == true {
				if let rates = parsed {
					self.bnrrates = rates
					self.tableView?.reloadData()
				}
			} else {
				print("Error when getting parsed data")
			}
		}
	}

//	Table View Methods
	
	func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Rates Cell", for: indexPath) as! RateTableViewCell

		let currentRate = bnrrates[indexPath.row]
		
		cell.rateFlag?.layer.cornerRadius = (cell.rateFlag?.frame.size.height)! / 2
		cell.rateFlag?.layer.masksToBounds = true
		cell.rateFlag?.contentMode = UIViewContentMode.scaleAspectFill
		cell.rateFlag?.clipsToBounds = true
		cell.rateFlag?.image = UIImage(named: currentRate.code!)
		
		cell.codeLabel?.text = currentRate.code
		cell.rateValue?.text = currentRate.conversionRate
		cell.longName?.text = self.fullNameDictionary[currentRate.code!]
		
		return cell
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		let rows = bnrrates.count
		return rows
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
		self.performSegue(withIdentifier: "ratesEvolutionSegue", sender: self)
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
//	Segue
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ratesEvolutionSegue" {
//			let indexPath = tableView?.indexPathForSelectedRow
//			let destinationController = segue.destinationViewController as! BNREvolutionViewController
		}
	}
}

