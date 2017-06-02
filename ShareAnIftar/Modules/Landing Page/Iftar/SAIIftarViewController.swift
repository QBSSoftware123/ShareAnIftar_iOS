//
//  SAIIftarViewController.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 05/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIIftarViewController: SAIViewController {

    
    let storyBoard : UIStoryboard = UIStoryboard (name: SAIStoryBoardIdentifiers.SAIStoryBoardMain , bundle: nil)

    @IBOutlet weak var menuItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        loadHTML (pageName: "iftar2")
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        // Do any additional setup after loading the view.
        if self.revealViewController() != nil {
            menuItem.target = self.revealViewController()
            menuItem.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    @IBAction func donateAction(_ sender: Any)
    {
        // iftarDonateVC
        let isLoggedIn : String? = UserDefaults.standard.string(forKey: "LoggedIn")
        if (isLoggedIn != nil)
        {
            let gemVC = storyBoard.instantiateViewController(withIdentifier: "iftarDonateVC")
            self.present(gemVC, animated: true, completion: nil)
        }
        else
        {
            let loginVC = storyBoard.instantiateViewController(withIdentifier: "LoginVC")
            self.navigationController?.present(loginVC, animated: true, completion: nil)
        }
    }
}
