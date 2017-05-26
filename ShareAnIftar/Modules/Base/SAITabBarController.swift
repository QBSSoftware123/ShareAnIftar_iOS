//
//  SAITabBarController.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 05/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAITabBarController: UITabBarController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func refreshViewDetails() {
        
        let selectedViewController = self.selectedViewController
        if(selectedViewController is UINavigationController)
        {
            let navigationController = self.selectedViewController as! UINavigationController!
            let refreshVC = navigationController?.topViewController
            if refreshVC is SAIViewController {
                (refreshVC as? SAIViewController)?.refreshViewDetails()
            }
        }
        
    }

}
