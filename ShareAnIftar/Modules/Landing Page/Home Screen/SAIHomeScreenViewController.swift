//
//  SAIHomeScreenViewController.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 05/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIHomeScreenViewController: SAIViewController {

    // Outlet for Side Panel
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        // Setting the background color of the view controller to AppColor
        self.view.backgroundColor = SAIColorConstants.SAIAppColor

        // Side Panel Button Action.
        if self.revealViewController() != nil
        {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // Adding Floating Button.
        let floatButton = KCFloatingActionButton()
        floatButton.buttonColor = SAIColorConstants.SAIAppGreenColor
        floatButton.addItem(title: "Share An Iftar")
        self.view.addSubview(floatButton)
    }
    
    // MARK: -  Share Action Button
    @IBAction func shareButtonAction(_ sender: Any)
    {
        self.tabBarController?.selectedIndex = 1
    }
}
