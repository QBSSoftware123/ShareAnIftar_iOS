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
    }
}
