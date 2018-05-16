//
//  SAIOTPViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/20/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIOTPViewController: UIViewController {

    //    http://shareaniftar.com/api/validate_otp.php?user_id=7&otp=253652
    // http://shareaniftar.com/api/validate_otp.php?user_id=Optional(72)&phone=255995
    
    @IBOutlet weak var OTPTextField: UITextField!
    var userID = "user_id="
    let phoneNo = "&otp="
    var userID2 : Int = 0
    var phoneNo2 = ""
    // user_id=Karthik&phone=9738953613
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        OTPTextField.keyboardType = UIKeyboardType.numberPad
    }
    
    @IBAction func done(_ sender: Any)
    {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        self.view.window?.rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "SWRevealViewController")
    }
    @IBAction func submitOTP(_ sender: Any)
    {
        //Add progress before you start fetching
        self.phoneNo2 = self.OTPTextField.text!
        print("\(phoneNo2)")
        self.userID2 =  UserDefaults.standard.integer(forKey: "UserID")
        print("\( userID2)")
        
        SIANetworkService.defaultManger.sentRequestFor(serviceName: "validate_otp", withParameters: "\(userID)\(userID2)\(phoneNo)\(phoneNo2)", completionHandler:{(response:Any?, error:Error?) in
            
            //Display on main queue
            DispatchQueue.main.async { [unowned self] in
                
                //Remove Progress
                //   HUD.hide()
                
                if((error) != nil)
                {
                    let alert = UIAlertController(title: "Error", message: "Please Try Again", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                //Populate the data
                let responseDict : [String:Any] = response as! [String:Any]
                print("Response: \(responseDict)")
                if (responseDict["result"] as! String == "reg_success")
                {
                    print("Alhamdulillah")
                    UserDefaults.standard.set("YES", forKey: "LoggedIn")
                    
                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    self.view.window?.rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "SWRevealViewController")
                }
                else
                {
                    print("Astagfirullah")
                    let alert = UIAlertController(title: "Invalid OTP", message: "Please Enter Valid OTP", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }
        })
    }
}

