
//
//  SAIDuaTableViewCell.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIDuaTableViewCell: UITableViewCell {

    @IBOutlet weak var arabicText: UITextView!
    @IBOutlet weak var dayCount: UILabel!
    @IBOutlet weak var readMore: UIButton!
    @IBOutlet weak var duaText: UITextView!
    var urlWhats : String!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
