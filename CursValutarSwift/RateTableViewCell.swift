//
//  RateTableViewCell.swift
//  CursValutarSwift
//
//  Created by Alexandru Clapa on 22/10/2015.
//  Copyright © 2015 Alexandru Clapa. All rights reserved.
//

import UIKit

class RateTableViewCell: UITableViewCell {

	@IBOutlet weak var codeLabel: UILabel?
	@IBOutlet weak var rateFlag: UIImageView?
	@IBOutlet weak var rateValue: UILabel?
	@IBOutlet weak var longName: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
