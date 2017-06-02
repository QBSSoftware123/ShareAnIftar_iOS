//
//  SAINewVideoTableViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/27/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAINewVideoTableViewController: UITableViewController {

    @IBOutlet weak var youTubeWebView3: UIWebView!
    @IBOutlet weak var youTubeWebView2: UIWebView!
    @IBOutlet weak var youTubeWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        getVideo(videoCode: "8bQ-L3OpmKM?rel=0")
        getVideo1 (videoCode: "ef3rbrkGqs0?rel=0")
        getVideo2(videoCode: "TK-Ckzk8OQU?rel=0")
    }

    @IBAction func dismissVC(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getVideo(videoCode:String)
    {
            let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
            youTubeWebView2.loadRequest(URLRequest(url: url!))
    }
  
    func getVideo1(videoCode:String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        youTubeWebView3.loadRequest(URLRequest(url: url!))
    }
    
    func getVideo2(videoCode:String)
    {
        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
        youTubeWebView.loadRequest(URLRequest(url: url!))
    }
}
