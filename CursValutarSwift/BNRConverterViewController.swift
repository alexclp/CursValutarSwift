//
//  BNRConverterViewController.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 15/05/2017.
//  Copyright © 2017 Alexandru Clapa. All rights reserved.
//

import UIKit

class BNRConverterViewController: UIViewController {

	fileprivate let kNumberOfRows = 4
	fileprivate let kNumberOfColumns = 3
	fileprivate let kNumberOfSections = 1
	fileprivate let kCellSpacingTop: CGFloat = 20.0
	fileprivate let kCellSpacingLeft: CGFloat = 0.5
	fileprivate let kCellSpacingBottom: CGFloat = 20.0
	fileprivate let kCellSpacingRight: CGFloat = 0.5

	fileprivate let collectionViewLabelsText = ["1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "0", "< - >"]

	@IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

		self.automaticallyAdjustsScrollViewInsets = false
		configureCollectionViewLayout()

		self.view.backgroundColor = UIColor.hexStringToUIColor(hex: "DAC2AA")
		collectionView.backgroundColor = UIColor.hexStringToUIColor(hex: "DAC2AA")
    }

	fileprivate func configureCollectionViewLayout() {
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: kCellSpacingTop, left: kCellSpacingLeft, bottom: kCellSpacingBottom, right: kCellSpacingRight)
		layout.minimumInteritemSpacing = 0
		layout.minimumLineSpacing = 0
		collectionView.collectionViewLayout = layout

		if let tabBar = tabBarController?.tabBar {
			let adjustForTabbarInsets = UIEdgeInsets(top: 0, left: 0, bottom: tabBar.frame.height, right: 0)
			collectionView.contentInset = adjustForTabbarInsets
			collectionView.scrollIndicatorInsets = adjustForTabbarInsets
		}
	}
}

extension BNRConverterViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView,
	                    layout collectionViewLayout: UICollectionViewLayout,
	                    sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		var collectionSize = collectionView.frame.size
		if let tabBar = tabBarController?.tabBar {
			collectionSize.height -= tabBar.frame.height

		}

		let itemWidth = collectionSize.width / CGFloat(kNumberOfColumns) - (kCellSpacingLeft + kCellSpacingRight) / CGFloat(kNumberOfColumns)
		let itemHeight = collectionSize.height / CGFloat(kNumberOfRows) - (kCellSpacingTop + kCellSpacingBottom) / CGFloat(kNumberOfRows)
		return CGSize(width: itemWidth, height: itemHeight)
	}
}

extension BNRConverterViewController: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return kNumberOfSections
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return kNumberOfRows * kNumberOfColumns
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath)

		cell.backgroundColor = UIColor.white
		cell.layer.borderColor = UIColor.hexStringToUIColor(hex: "D4D4D4").cgColor
		cell.layer.borderWidth = 2.0
		cell.layer.cornerRadius = 5

		let label = UILabel(frame: cell.bounds)
		label.textAlignment = .center
		label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.light)
		label.text = collectionViewLabelsText[indexPath.row]
		cell.addSubview(label)

		return cell
	}
}
