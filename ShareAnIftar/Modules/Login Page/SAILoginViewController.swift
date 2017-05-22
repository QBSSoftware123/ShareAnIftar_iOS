//
//  SAILoginViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/20/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAILoginViewController: UIViewController {
    var userID : String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func generateOTP(_ sender: Any)
    {
        SIANetworkService.defaultManger.sentRequestFor(serviceName: "generate_otp", withParameters: "user_name=Tauqeer&phone=9945760839", completionHandler:{(response:Any?, error:Error?) in
            
            //Display on main queue
            DispatchQueue.main.async { [unowned self] in
                
                //Remove Progress
                // HUD.hide()
                
                //Populate the data
                let responseDict : [String:Any] = response as! [String:Any]
                //self.counterValue = responseDict["count"] as! String
                // self.counterTextField.text = self.counterValue
                // print(self.counterValue)
                self.userID = responseDict ["user_id"] as? String
                UserDefaults.standard.set(self.userID, forKey: "UserID") //setObject
                print("\(String(describing: self.userID))")

                print("Response: \(responseDict)")
                
            }
        })
        
    }
}
