//
//  SAIViewController.swift
//  ShareAnIftar
//
//  Created by Tauqeer Ahmed Khan on 02/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIViewController: UIViewController {
    
    // Webview to load HTML Pages.
    @IBOutlet weak var htmlWebView: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

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
        let url = Bundle.main.url(forResource: pageName, withExtension: "html")
        let myRequest = NSURLRequest(url: url!)
        self.htmlWebView.loadRequest(myRequest as URLRequest)
    }
    
    @IBAction func dismissVC(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
}
