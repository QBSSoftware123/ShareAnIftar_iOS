//
//  SAIUserProfileViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class Model
{
    var description: String = ""
    var value: String = ""
    
    init(withDescription description: String?, andValue value: String?) {
        self.description = description!
        self.value = value!
    }

}

class SAIUserProfileViewController: UIViewController , UITableViewDelegate , UITableViewDataSource
{

    @IBOutlet weak var userDataTableView: UITableView!
    
    var testModel = [Model]()
    var userId : Int = 0
    var dataArray : Array = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    var dataArray1 = ["Total Donations","Total Eid Kits","Total Iftar Kits","Total Ramadan Kits Donated","Total Daily Kits","Total Monthly Kits","Total Donations Towards Education"]
       var dataArray2 = ["0","0","0","0","0","0","0"]
    
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
      return dataArray1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : SAIUserTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SAIUserTableViewCell
        
            cell.donationDescription.text  = dataArray1 [indexPath.row]
        //userModel?.donationDes [indexPath.row]
       
            cell.donationData.text = dataArray2 [indexPath.row]
                //userModel?.donationAmt [indexPath.row] as! String?
        return cell
    }
    
    func fetchUserProfile ()
    {
//        let isLoggedIn : String? = UserDefaults.standard.string(forKey: "LoggedIn")
//        if (isLoggedIn == nil)
//        {
//            HUD.flash(.label("Please Register to Access User Profile"), delay: 4.0) { _ in
//                print("Register.")
//            }
//            dismiss(animated: true, completion: nil)
//        }
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
                
                for (desc, value) in responseDict
                {
                    self.testModel.append(Model.init(withDescription: desc, andValue: value as? String))
                }
                
                print("\nMODEL\n")
                for test in self.testModel {
                    self.dataArray = [test.value]
                    print("\(test.value)")
                }
                print("DataArray:\(self.dataArray)")
                
                 print("Response: \(responseDict)")
                
            }
        })

        
    }
}
