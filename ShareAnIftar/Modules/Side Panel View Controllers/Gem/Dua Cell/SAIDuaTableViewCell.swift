
//
//  SAIDuaTableViewCell.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIDuaTableViewCell: UITableViewCell {

    @IBOutlet weak var readMore: UIButton!
    @IBOutlet weak var duaText: UITextView!
    var urlWhats : String!
    @IBAction func shareToWhatsApp(_ sender: Any) {
        
        let message  = duaText.text
        if let value = message{
             urlWhats = "whatsapp://send?text=\(value)"
        }
        
        if let urlString = urlWhats.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) {
            if let whatsappURL = NSURL(string: urlString) {
                if UIApplication.shared.canOpenURL(whatsappURL as URL) {
                    UIApplication.shared.open(whatsappURL as URL, options: [:], completionHandler: { (Bool) in
                        
                    })
                } else {
                    // Handle a problem
                    print("Nai Hota")
                }
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        readMore.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
