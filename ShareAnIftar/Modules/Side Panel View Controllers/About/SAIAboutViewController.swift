//
//  SAIAboutViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIAboutViewController: SAIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        loadHTML(pageName: "about")
    }

    @IBAction override func dismissVC(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
}
