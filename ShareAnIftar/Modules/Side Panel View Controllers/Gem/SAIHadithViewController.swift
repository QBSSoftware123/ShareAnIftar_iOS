//
//  SAIHadithViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class HadithModel: Codable {
    let date: String?
    let title: String?
    let description: String?
}

class SAIHadithViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var hadithModel: [HadithModel] = [HadithModel]()

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //Register Table View
        tableView.register(UINib(nibName: "SAIHadithTableViewCell", bundle: nil), forCellReuseIdentifier: "HadithCell")
        
        getHadith()

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
        if hadithModel.count > 0 {
            return hadithModel.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : SAIHadithTableViewCell = tableView.dequeueReusableCell(withIdentifier: "HadithCell", for: indexPath) as! SAIHadithTableViewCell
        cell.hadithText.text = hadithModel[indexPath.row].description
        cell.title.text = hadithModel[indexPath.row].title
        return cell
    }
    
    func getHadith(){
        activityIndicator.startAnimating()
        SIANetworkService.defaultManger.sentRequestForHadith(serviceName: "hadith_notification", withParameters: "No") { (response, error) in
            if let error = error {
                print(error)
            }
            if let response = response {
                print(response)
                self.hadithModel.append(response)
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.removeFromSuperview()
                    self.tableView.reloadData()
                }
            }
        }
    }
}
