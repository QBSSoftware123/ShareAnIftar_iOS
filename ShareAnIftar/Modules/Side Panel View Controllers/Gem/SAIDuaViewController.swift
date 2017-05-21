//
//  SAIDuaViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIDuaViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //Register Table View
        tableView.register(UINib(nibName: "SAIDuaTableViewCell", bundle: nil), forCellReuseIdentifier: "DuaCell")
        


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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : SAIDuaTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DuaCell", for: indexPath) as! SAIDuaTableViewCell
        return cell
    }
}
