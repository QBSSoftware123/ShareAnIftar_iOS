//
//  SAIDuaViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class DuaModel: Codable {
    let title: String?
    let arabic: String?
    let description: String?
}

class SAIDuaViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource {
    
    var duaModel : [DuaModel] = [DuaModel]()
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //Register Table View
        tableView.register(UINib(nibName: "SAIDuaTableViewCell", bundle: nil), forCellReuseIdentifier: "DuaCell")
        self.getDua()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dimissVC(_ sender: Any)
    {
       dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if duaModel.count > 0 {
            return duaModel.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : SAIDuaTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DuaCell", for: indexPath) as! SAIDuaTableViewCell
        cell.arabicText.text = duaModel[indexPath.row].arabic
        cell.duaText.text = duaModel[indexPath.row].description
        cell.dayCount.text = duaModel[indexPath.row].title
        return cell
    }
    
    func getDua() {
        
        activityIndicator.startAnimating()
        SIANetworkService.defaultManger.sentRequestForDua(serviceName: "dua_notification", withParameters: "No") { (response, error) in
            
            if let error = error {
                print(error)
            }
            if let response  = response {
                print(response)
                self.duaModel.append(response)
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.removeFromSuperview()
                    self.tableView.reloadData()
                }
            }
        }
    }
}
