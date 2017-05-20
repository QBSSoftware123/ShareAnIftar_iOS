//
//  SAILoginViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/20/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAILoginViewController: UIViewController {

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
        SIANetworkService.defaultManger.sentRequestFor(serviceName: "generate_otp", withParameters: "user_name=Karthik&phone=9738953613", completionHandler:{(response:Any?, error:Error?) in
            
            //Display on main queue
            DispatchQueue.main.async { [unowned self] in
                
                //Remove Progress
                // HUD.hide()
                
                //Populate the data
                let responseDict : [String:Any] = response as! [String:Any]
                //self.counterValue = responseDict["count"] as! String
               // self.counterTextField.text = self.counterValue
               // print(self.counterValue)
                 print("Response: \(responseDict)")
                
            }
        })

    }
}
