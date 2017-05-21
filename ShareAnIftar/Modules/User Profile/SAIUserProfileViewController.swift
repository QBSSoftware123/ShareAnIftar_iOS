//
//  SAIUserProfileViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIUserProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dimissVC(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
}
