//
//  SAIUserTableViewCell.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 23/05/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIUserTableViewCell: UITableViewCell {

    @IBOutlet weak var donationData: UILabel!
    @IBOutlet weak var donationDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
