//
//  SAIMonthlyViewController.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 05/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIMonthlyViewController: SAIViewController, UIScrollViewDelegate {
    var boolValue : Bool = false
    let storyBoard : UIStoryboard = UIStoryboard (name: SAIStoryBoardIdentifiers.SAIStoryBoardMain , bundle: nil)

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var menuItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load HTML Page
       // loadHTML(pageName: "ramadankit1")
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]

        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            menuItem.target = self.revealViewController()
            menuItem.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    @IBAction func donateButtonAction(_ sender: Any)
    {
        
        let isLoggedIn : String? = UserDefaults.standard.string(forKey: "LoggedIn")
        if (isLoggedIn != nil)
        {
            let monthlyDonateVC = storyBoard.instantiateViewController(withIdentifier: "monthlyDonateVC")
            self.present(monthlyDonateVC, animated: true, completion: nil)
        }
        else
        {
            let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginVC")
            self.navigationController?.present(loginVC, animated: true, completion: nil)
        }
    }
}
