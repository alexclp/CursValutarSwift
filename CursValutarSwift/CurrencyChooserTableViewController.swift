//
//  CurrencyChooserTableViewController.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 23/05/2017.
//  Copyright © 2017 Alexandru Clapa. All rights reserved.
//

import UIKit

protocol CurrencyChooserDelegate: class {
	func currencyLabel(withTag tag: Int, didFinishChoosingCurrency currency: String)
}

class CurrencyChooserTableViewController: UITableViewController {
	var currencyDictionary = [String: String]()
	var codesArray = [String]()
	weak var delegate: CurrencyChooserDelegate?
	var senderTag = -1

    override func viewDidLoad() {
        super.viewDidLoad()

		self.title = "Alegeți moneda"
		setupCancelButton()

		if let dict = PersistanceHelper.fetchFullNames() {
			currencyDictionary = dict
			codesArray = Array(currencyDictionary.keys)
			codesArray.sort(by: { (first, second) -> Bool in
				return first < second
			})
		}
	}

	fileprivate func setupCancelButton() {
		let cancelButton = UIBarButtonItem(title: "Anulare", style: .plain, target: self, action: #selector(self.cancelButtonPressed(sender:)))
		self.navigationItem.leftBarButtonItem = cancelButton
	}

	@objc func cancelButtonPressed(sender: UIBarButtonItem) {
		self.dismiss(animated: true, completion: nil)
	}

	// MARK: Table view methods

	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return currencyDictionary.keys.count
	}

	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath)
		let currencyCode = codesArray[indexPath.row]
		cell.textLabel?.text = currencyDictionary[currencyCode]
		cell.detailTextLabel?.text = currencyCode
		return cell
	}

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let chosenCode = codesArray[indexPath.row]
		delegate?.currencyLabel(withTag: senderTag, didFinishChoosingCurrency: chosenCode)
		tableView.deselectRow(at: indexPath, animated: true)
		self.dismiss(animated: true, completion: nil)
	}
}
