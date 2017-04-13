//
//  SAIVideoViewController.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 07/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIVideoViewController: SAIViewController , UITableViewDataSource {

    // WebView Outlet to play YouTube Videos
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    // MARK: -  TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
      return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
      let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath)
    // getVideo(videoCode: "C0Z6tJdeQ_E?rel=0")
      return cell
    }
    
//    func getVideo(videoCode:String)
//    {
//        let url = URL(string: "https://www.youtube.com/embed/\(videoCode)")
//        youTubeWebView.loadRequest(URLRequest(url: url!))
//    }

    @IBAction func DismissView(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
}
