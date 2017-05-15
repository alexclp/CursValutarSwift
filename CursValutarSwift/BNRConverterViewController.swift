//
//  BNRConverterViewController.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 15/05/2017.
//  Copyright © 2017 Alexandru Clapa. All rights reserved.
//

import UIKit

class BNRConverterViewController: UIViewController {
	
	@IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BNRConverterViewController: UICollectionViewDelegate {
	
}

extension BNRConverterViewController: UICollectionViewDataSource {
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 12
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath)
		cell.backgroundColor = UIColor.blue
		return cell
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
		let screenSize = UIScreen.main.bounds
		let screenWidth = screenSize.width
		let cellSquareSize: CGFloat = screenWidth / 2.0
		return CGSize.init(width: cellSquareSize, height: cellSquareSize)
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
		return UIEdgeInsetsMake(0, 0, 0.0, 0.0)
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
		return 0.0
	}
	
	func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
		return 0.0
	}
}
