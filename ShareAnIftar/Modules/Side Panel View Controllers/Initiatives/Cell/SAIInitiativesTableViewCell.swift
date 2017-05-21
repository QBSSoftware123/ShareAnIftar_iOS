//
//  SAIInitiativesTableViewCell.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIInitiativesTableViewCell: UITableViewCell {

    @IBOutlet weak var someLabel: UILabel!
    @IBOutlet weak var someView: UIView!
    @IBOutlet weak var companyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        companyImage.layer.masksToBounds = true
        companyImage.layer.cornerRadius = 10
        companyImage.layer.borderColor = SAIColorConstants.SAIAppColor.cgColor
        companyImage.layer.borderWidth = 1.0
        
        // View
        someView.layer.masksToBounds = true
        someView.layer.cornerRadius = 10
        someView.layer.borderColor = SAIColorConstants.SAIAppColor.cgColor
        someView.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
