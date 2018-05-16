//
//  SAIUserProfileViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class ProfileModel: Codable {
    let user_id : String?
    let user: String?
    let prof_pic: String?
    let total_donation: String?
    let eid_kit: String?
    let iftar_kit:String?
    let ramadan_kit: String?
    let monthly_kit: String?
    let daily: String?
    let weekly: String?
    let education: String?
    let medical: String?
    let relief: String?
    let feed_mother: String?
}

class SAIUserProfileViewController: UIViewController , UITableViewDelegate , UITableViewDataSource
{
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userDataTableView: UITableView!
    
    var userId : Int = 0
    
    var dataArray1 = ["Total Donations","Total Iftar Kits Donated","Total Monthly Kits","Total Ramadan Kits","Total Feed A Mother Kits"]
    
    var dataArray2 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        //Register Table View
        userDataTableView.register(UINib(nibName: "SAIUserTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        self.userId = UserDefaults.standard.integer(forKey: "UserID")
        
        self.fetchUserProfile()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataArray2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : SAIUserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SAIUserTableViewCell
        cell.donationDescription.text  = dataArray1 [indexPath.row]
        if dataArray2.count == 0 {
            cell.donationData.text = ""
        } else {
            cell.donationData.text = dataArray2 [indexPath.row]
        }
        return cell
    }
    
    func fetchUserProfile ()
    {
        self.activityIndicator.startAnimating()
        SIANetworkService.defaultManger.sentRequestForProfile(serviceName: "user_profile", withParameters: "user_id=\(userId)") { (response, error) in
            if let error = error {
                print(error)
            }
            
            if let response = response {
                if let totalDonations = response.total_donation {
                    self.dataArray2.append(totalDonations)
                }
                if let totalIftarKits = response.iftar_kit {
                    self.dataArray2.append(totalIftarKits)
                }
                if let motherKits = response.monthly_kit {
                    self.dataArray2.append(motherKits)
                }
                if let totalRamadanKits = response.ramadan_kit {
                    self.dataArray2.append(totalRamadanKits)
                }
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.removeFromSuperview()
                    if let userName = response.user{
                        self.userName.text = userName
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
}
