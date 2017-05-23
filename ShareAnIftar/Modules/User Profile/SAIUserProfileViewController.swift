//
//  SAIUserProfileViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class userProfileModel
{
    var donationDes : [String] = []
    var donationAmt : [AnyObject] = []
}

class SAIUserProfileViewController: UIViewController , UITableViewDelegate , UITableViewDataSource
{

    @IBOutlet weak var userDataTableView: UITableView!
    
    var userModel : userProfileModel?
    
    var userId : Int = 0
    
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
      return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : SAIUserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SAIUserTableViewCell
        
            cell.donationDescription.text  = "Some Description"
                //userModel?.donationDes [indexPath.row]
       
            cell.donationData.text = "222"
                //userModel?.donationAmt [indexPath.row] as! String?
        return cell
    }
    
    func fetchUserProfile ()
    {
        
        // http://shareaniftar.com/api/user_profile.php?user_id=7
        
        //Add progress before you start fetching
        HUD.show(HUDContentType.labeledRotatingImage(image:  UIImage(named: "progress_circular"), title:"" , subtitle:"Fetching User Data..."))
        
        
        SIANetworkService.defaultManger.sentRequestFor(serviceName: "user_profile", withParameters: "user_id=\(userId)", completionHandler:{(response:Any?, error:Error?) in
            
            //Display on main queue
            DispatchQueue.main.async { [unowned self] in
                //Remove Progress
                HUD.hide()
                
                
                //Populate the data
                let responseDict : [String:Any] = response as! [String:Any]
//                self.counterValue = responseDict["count"] as! String
//                self.counterTextField.text = self.counterValue
//                print(self.counterValue)
                 print("Response: \(responseDict)")
                
            }
        })

        
    }

    @IBAction func dimissVC(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
}
