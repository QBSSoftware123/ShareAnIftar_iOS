//
//  SAISideMenuTableViewController.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 05/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAISideMenuTableViewController: UITableViewController {
    
    // Constant for Storyboard refrence
    let storyBoard : UIStoryboard = UIStoryboard (name: SAIStoryBoardIdentifiers.SAIStoryBoardMain , bundle: nil)

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if (indexPath.row == 1)
        {
            let gemVC = storyBoard.instantiateViewController(withIdentifier: SAIStoryBoardIdentifiers.SAIGemViewControllerIdentifier)
            self.present(gemVC, animated: true, completion: nil)
        }
        if indexPath.row == 5
        {
            
            if let name = NSURL(string: "https://itunes.apple.com/us/app/ShareAnIftar/id1239892904?ls=1&mt=8") {
                let appName  = " Share An Iftar iOS App"
                let objectsToShare :Array = [name, appName] as [Any]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                activityVC.excludedActivityTypes = [UIActivityType.print, UIActivityType.postToWeibo, UIActivityType.copyToPasteboard, UIActivityType.addToReadingList, UIActivityType.postToVimeo,UIActivityType.airDrop,UIActivityType.message,UIActivityType.mail,UIActivityType.postToTwitter]

                self.present(activityVC, animated: true, completion: nil)
            }
            else
            {
                // show alert for not available
            }
        }
    }
}
