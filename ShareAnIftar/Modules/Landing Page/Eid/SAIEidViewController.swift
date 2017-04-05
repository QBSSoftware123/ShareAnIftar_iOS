//
//  SAIEidViewController.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 05/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIEidViewController: SAIViewController {

    @IBOutlet weak var menuItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            menuItem.target = self.revealViewController()
            menuItem.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}
