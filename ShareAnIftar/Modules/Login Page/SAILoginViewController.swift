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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    var userName = ""
    var phoneNumber = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        phoneNumberTextField.keyboardType = UIKeyboardType.numberPad
        self.navigationController?.isNavigationBarHidden = false


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func generateOTP(_ sender: Any)
        
    {
        
        self.userName = nameTextField.text!
        self.phoneNumber = phoneNumberTextField.text!
        
         if phoneNumberTextField.text?.characters.count != 10
         {
            let alert = UIAlertController(title: "Invalid Number", message: "Please Enter 10-Digit Number", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dimiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        // Hit the service!
        SIANetworkService.defaultManger.sentRequestFor(serviceName: "generate_otp", withParameters: "user_name=\(userName)&phone=\(phoneNumber)", completionHandler:{(response:Any?, error:Error?) in
            
            //Display on main queue
            DispatchQueue.main.async { [unowned self] in
                
                //Remove Progress
                // HUD.hide()
                
                //Populate the data
                let responseDict : [String:Any] = response as! [String:Any]
                self.userID = responseDict ["user_id"] as? String
                UserDefaults.standard.set(self.userID, forKey: "UserID") //setObject
                print("\(String(describing: self.userID))")

                print("Response: \(responseDict)")
                
            }
        })
        
    }
    
    @IBAction func skipButton(_ sender: Any)
    {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        self.view.window?.rootViewController = mainStoryboard.instantiateViewController(withIdentifier: "TabBarVC")
    }
    
}
