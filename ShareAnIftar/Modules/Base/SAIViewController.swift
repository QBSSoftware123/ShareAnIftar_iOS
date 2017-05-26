//
//  SAIViewController.swift
//  ShareAnIftar
//
//  Created by Tauqeer Ahmed Khan on 02/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIViewController: UIViewController , UIWebViewDelegate{
    
    // Webview to load HTML Pages.
    @IBOutlet weak var htmlWebView: UIWebView!
    
    //Side Bar
    var revealVC:SWRevealViewController?
    
    //Side Bar Revealed
    var isSideBarRevealed:Bool = false
    
    //Blank View
    var blankView = UIView()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if (htmlWebView != nil)
        {
            self.htmlWebView.delegate = self
        }
        
//        //Configure for the side bar
//        if(self.isSideBarMenuRequired() && self.revealVC == nil)
//        {
//            self.initialiseSideBarMenu()
//        }

    }
    
    func refreshViewDetails() {
        //Do Nothing but invokes during the right time, refresh and load
    }
    
    func isSideBarMenuRequired()->Bool {
        //By Default returns false
        return false
    }
    
    //MARK : - Side Bar Menu
    func initialiseSideBarMenu() {
        
        let rightBarButtonItem = UIBarButtonItem()
        rightBarButtonItem.image = UIImage(named: "Hamburger")
        if revealViewController() != nil {
            self.revealVC = revealViewController()
            rightBarButtonItem.target = self
            rightBarButtonItem.action = #selector(toggleSideBar)
            
            self.revealVC?.rightViewRevealWidth = 150
            
            view.addGestureRecognizer((self.revealVC?.panGestureRecognizer())!)
            self.navigationItem.leftBarButtonItem = rightBarButtonItem
        }
    }
    
    //Toggle Side Bar
    func toggleSideBar()
    {
        self.isSideBarRevealed = !(self.isSideBarRevealed)
        revealViewController().revealToggle(nil)
        
        if(self.isSideBarRevealed)
        {
            self.blankView = UIView(frame: self.view.bounds)
            self.view.addSubview(blankView)
            
            blankView.isUserInteractionEnabled = true
            blankView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.handleTap)))
        }
        else
        {
            blankView.removeFromSuperview()
        }
    }
    
    func handleTap(gestureRecognizer: UIGestureRecognizer) {
        self.toggleSideBar()
    }
    
    //MARK: - Method to add gradient color
    func addBlueGradientColor(GradientColor: String)
    {
        let gradient: CAGradientLayer = CAGradientLayer()
        if GradientColor == "Blue"
        {
            gradient.colors = [SAIColorConstants.SAIAppColor.cgColor, UIColor.white.cgColor]
        }
        else
        {
            gradient.colors = [SAIColorConstants.SAIAppGreenColor.cgColor, UIColor.white.cgColor]
        }
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.size.width, height: self.view.frame.size.height - 150)
        
        self.view.layer.insertSublayer(gradient, at: 0)

    }
    
    //MARK: - Loading HTML Mehods
    func loadHTML (pageName: String)
    {
        HUD.show(HUDContentType.labeledRotatingImage(image:  UIImage(named: "progress_circular"), title:"" , subtitle:"Fetching…"))

        let url = Bundle.main.url(forResource: pageName, withExtension: "html")
        let myRequest = NSURLRequest(url: url!)
        DispatchQueue.global(qos: .background).async {
            // Background Thread
            DispatchQueue.main.async {
                // Run UI Updates
                self.htmlWebView.loadRequest(myRequest as URLRequest)
            }
        }
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
      HUD.hide()
    }
    
    
    @IBAction func dismissVC(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
}
