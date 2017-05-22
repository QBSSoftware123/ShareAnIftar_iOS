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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Load HTML Page
        loadHTML(pageName: "eidkit1")
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            menuItem.target = self.revealViewController()
            menuItem.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    // MARK: - Prepare for Segue Method
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == SAISegueIdentifiers.SAIEidSegueIdentifiers
        {
            let donateVC : SAIIftarDonateViewController = segue.destination as! SAIIftarDonateViewController
            // Setting the flag to identify View Controller.
            donateVC.eidVC = true
        }
    }
}
