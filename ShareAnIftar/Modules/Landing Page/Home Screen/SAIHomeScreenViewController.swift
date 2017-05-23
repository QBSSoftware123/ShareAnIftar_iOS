//
//  SAIHomeScreenViewController.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 05/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIHomeScreenViewController: SAIViewController ,SWRevealViewControllerDelegate {

    // Outlet for Side Panel
    @IBOutlet var menuButton: UIBarButtonItem!
    
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
        
//        // Adding Floating Button.
//        let floatButton = KCFloatingActionButton()
//        floatButton.buttonColor = SAIColorConstants.SAIAppGreenColor
//        let tap = UITapGestureRecognizer(target: self, action:#selector(handleTap))
//        
//        floatButton.addGestureRecognizer(tap)
//        floatButton.addItem(title: "Call Us")
//        self.view.addSubview(floatButton)
        
        let fab = KCFloatingActionButton()
        fab.buttonColor = SAIColorConstants.SAIAppGreenColor
        fab.addItem("Call Us", icon: nil, handler: { item in
//            let alert = UIAlertController(title: "Hey Call Us On...", message: "9986021214", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "9986021214", style: .default, handler: nil))
//            self.present(alert, animated: true, completion: nil)
            fab.callUs(phoneNumber: "9986021214")
        })
        self.view.addSubview(fab)
        
        loadCounter()
        
    }
    
    func callUs ()
    {
        print("Sallam")
    }
    
    func handleTap() {
        print("tapped")
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
