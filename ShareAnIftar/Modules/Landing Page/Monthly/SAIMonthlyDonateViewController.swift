//
//  SAIMonthlyDonateViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 6/1/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIMonthlyDonateViewController: SAIViewController , UITextFieldDelegate {
    
    @IBOutlet weak var VCTitle: UILabel!
    
    var totalAmount: String?
    var numberOfMonths: String?
    
    var accessCode = "AVDM77FD71CG80MDGC"
    var merchantId = "99763"
    var amount = ""
    var currency = "INR"
    var orderId : uint!
    var redirectUrl = "http://shareaniftar.com/ccavResponseHandler.php"
    var cancelUrl = "http://shareaniftar.com/ccavResponseHandler.php"
    var rsaKeyUrl = "http://www.shareaniftar.com/GetRSA.php"
    var delivery_address = ""
    var delivery_name = "iOS"
    var merchant_param2 = ""
    var merchant_param3 = ""
    var merchant_param4 = ""
    var merchant_param5 = ""

    @IBOutlet weak var selectDonationButton: UIButton!
    var feedMotherList = ["Pay 1,500 for a month", "Pay 4,500 for 3 months", "Pay 9,000 for 6 months", "Pay 18,000 for 1 year"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addBlueGradientColor(GradientColor: SAIGradientColorConstants.SAIBlueGradient)
        selectDonationButton.titleLabel?.textColor = UIColor.white
        selectDonationButton.backgroundColor = UIColor.white
        selectDonationButton.layer.cornerRadius = 5
        selectDonationButton.layer.borderWidth = 1
        selectDonationButton.layer.borderColor = SAIColorConstants.SAIAppColor.cgColor
        
        
        let randomNumber = arc4random () % 9999999 + 1
        self.orderId = randomNumber
        
    }

    @IBAction func selectLocation(_ sender: Any)
    {
        let alertController = UIAlertController(title: "Select Package", message: "", preferredStyle: .actionSheet)
        
        alertController.view.tintColor = SAIColorConstants.SAIAppColor
        
        let location0 = UIAlertAction(title: feedMotherList[0], style: .default, handler:{ action -> Void in
            self.selectDonationButton.setTitle(self.feedMotherList[0], for: .normal)
        })
        alertController.addAction(location0)
        
        let location1 = UIAlertAction(title: feedMotherList[1], style: .default, handler:{ action -> Void in
             self.selectDonationButton.setTitle(self.feedMotherList[1], for: .normal)
        })
        alertController.addAction(location1)
        
        let location2 = UIAlertAction(title: feedMotherList[2], style: .default, handler:{ action -> Void in
             self.selectDonationButton.setTitle(self.feedMotherList[2], for: .normal)
        })
        alertController.addAction(location2)
        
        let location3 = UIAlertAction(title: feedMotherList[3], style: .default, handler:{ action -> Void in
             self.selectDonationButton.setTitle(self.feedMotherList[3], for: .normal)
        })
        alertController.addAction(location3)
        
        present(alertController, animated: true, completion: {
            let view = (alertController.view.superview?.subviews[1])! as UIView
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
        })
    }
    
    func alertControllerBackgroundTapped()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    var webCC : CCWebViewController?

    
    @IBAction func donateMonthly(_ sender: Any)
    {
        let title = selectDonationButton.titleLabel?.text

        if title == "Select Donation"
        {
            let alert = UIAlertController(title: "Invalid Selection", message: "Please Select Donation Package", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if title == "Pay 1,500 for a month" {
            self.totalAmount = "1500"
            self.numberOfMonths = "1"
        }
        
        if title == "Pay 4,500 for 3 months" {
            self.totalAmount = "4500"
            self.numberOfMonths = "3"
        }
        
        if title == "Pay 9,000 for 6 months" {
            self.totalAmount = "9000"
            self.numberOfMonths = "6"
        }
        
        if title == "Pay 18,000 for 1 year" {
            self.totalAmount = "18000"
            self.numberOfMonths = "12"
        }
        
        let storyBoard : UIStoryboard = UIStoryboard (name: SAIStoryBoardIdentifiers.SAIStoryBoardMain , bundle: nil)
        webCC  = storyBoard.instantiateViewController(withIdentifier: "CCWebViewController") as? CCWebViewController
        webCC?.accessCode = self.accessCode
        webCC?.cancelUrl = self.cancelUrl
        webCC?.orderId = self.orderId
        webCC?.amount = self.totalAmount
        webCC?.currency = "INR"
        webCC?.merchantId = self.merchantId
        webCC?.redirectUrl =  self.redirectUrl
        webCC?.cancelUrl = self.cancelUrl
        webCC?.rsaKeyUrl = self.rsaKeyUrl
        
        webCC?.merchant_param2 = "Feed a Mother"
        webCC?.merchant_param3 = "1 Month ₹1,500"
        webCC?.merchant_param4 = self.numberOfMonths
        webCC?.merchant_param5 = UserDefaults.standard.integer(forKey: "UserID")
        
        self.present(webCC!, animated: true, completion: nil)
    }
    @IBAction func dimissViewController(_ sender: Any)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
}
