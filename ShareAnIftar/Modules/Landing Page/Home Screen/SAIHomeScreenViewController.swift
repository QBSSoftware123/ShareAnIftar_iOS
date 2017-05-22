//
//  SAIHomeScreenViewController.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 05/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIHomeScreenViewController: SAIViewController {

    // Outlet for Side Panel
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    // Outlet for Counter
    @IBOutlet var counterTextField: UITextField!
    
    
    // Constant for Storyboard refrence
    let storyBoard : UIStoryboard = UIStoryboard (name: SAIStoryBoardIdentifiers.SAIStoryBoardMain , bundle: nil)
    
    var counterValue : String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        // Setting the background color of the view controller to AppColor
        self.view.backgroundColor = SAIColorConstants.SAIAppColor

        // Side Panel Button Action.
        if self.revealViewController() != nil
        {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        // Adding Floating Button.
        let floatButton = KCFloatingActionButton()
        floatButton.buttonColor = SAIColorConstants.SAIAppGreenColor
        floatButton.addItem(title: "Share An Iftar")
        self.view.addSubview(floatButton)
        
        loadCounter()
        
    }
    
    func loadCounter()
    {
        
        //Add progress before you start fetching
        HUD.show(HUDContentType.labeledRotatingImage(image:  UIImage(named: "progress_circular"), title:"" , subtitle:"Fetching Count…"))
        
        
        SIANetworkService.defaultManger.sentRequestFor(serviceName: "smile_counter", withParameters: "No", completionHandler:{(response:Any?, error:Error?) in
            
            //Display on main queue
            DispatchQueue.main.async { [unowned self] in
                //Remove Progress
                HUD.hide()
                
                
                //Populate the data
                let responseDict : [String:Any] = response as! [String:Any]
                self.counterValue = responseDict["count"] as! String
                self.counterTextField.text = self.counterValue
                print(self.counterValue)
                // print("Response: \(responseDict)")
                
            }
        })
    }
    
    // MARK: -  Share Action Button
    @IBAction func shareButtonAction(_ sender: Any)
    {
        self.tabBarController?.selectedIndex = 1
    }
    
    @IBAction func showUserProfile(_ sender: Any)
    {
    }
    
}
