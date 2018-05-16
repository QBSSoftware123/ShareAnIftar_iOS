//
//  SAIEidDonateViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/31/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIEidDonateViewController: SAIViewController , UITextFieldDelegate{

    
    @IBOutlet weak var VCTitle: UILabel!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var iftarCountTextField: UITextField!
    
    @IBOutlet weak var selectLocationButton: UIButton!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addBlueGradientColor(GradientColor: SAIGradientColorConstants.SAIBlueGradient)
        iftarCountTextField.keyboardType = UIKeyboardType.numberPad
        
        selectLocationButton.layer.cornerRadius = 5
        selectLocationButton.layer.borderWidth = 1
        selectLocationButton.layer.borderColor = SAIColorConstants.SAIAppColor.cgColor
        
        totalAmount.layer.cornerRadius = 5
        totalAmount.layer.borderWidth = 1
        totalAmount.layer.borderColor = SAIColorConstants.SAIAppColor.cgColor

        
        let randomNumber = arc4random () % 9999999 + 1
        self.orderId = randomNumber
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectLocation(_ sender: Any)
    {
        
        let alertController = UIAlertController(title: "Select Location", message: "", preferredStyle: .actionSheet)
        
        alertController.view.tintColor = SAIColorConstants.SAIAppColor
        
        let location0 = UIAlertAction(title: SAISortByPickerList[0], style: .default, handler:{ action -> Void in
            let titleString = SAISortByPickerList[0]
            self.selectLocationButton.setTitle(titleString, for: .normal)
        })
        alertController.addAction(location0)
        
        let location1 = UIAlertAction(title: SAISortByPickerList[1], style: .default, handler:{ action -> Void in
            let titleString = SAISortByPickerList[1]
            self.selectLocationButton.setTitle(titleString, for: .normal)
        })
        alertController.addAction(location1)
        
        let location2 = UIAlertAction(title: SAISortByPickerList[2], style: .default, handler:{ action -> Void in
            let titleString =  SAISortByPickerList[2]
            self.selectLocationButton.setTitle(titleString, for: .normal)
        })
        alertController.addAction(location2)
        
        let location3 = UIAlertAction(title: SAISortByPickerList[3], style: .default, handler:{ action -> Void in
            let titleString =  SAISortByPickerList[3]
            self.selectLocationButton.setTitle(titleString, for: .normal)
        })
        alertController.addAction(location3)
        
        
        let location4 = UIAlertAction(title: SAISortByPickerList[4], style: .default, handler:{ action -> Void in
            let titleString =  SAISortByPickerList[4]
            self.selectLocationButton.setTitle(titleString, for: .normal)
        })
        alertController.addAction(location4)
        
        let location5 = UIAlertAction(title: SAISortByPickerList[5], style: .default, handler:{ action -> Void in
            let titleString =  SAISortByPickerList[5]
            self.selectLocationButton.setTitle(titleString, for: .normal)
        })
        alertController.addAction(location5)
        
        present(alertController, animated: true, completion: {
            let view = (alertController.view.superview?.subviews[1])! as UIView
            view.isUserInteractionEnabled = true
            view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertControllerBackgroundTapped)))
        })
        
    }
    
    
    var textLabelValue: Int32? {
        if let value = textFieldValue {

                return value * 630
        

        } else {
            return nil
        }
    }
    
    let numberFormatter: NumberFormatter = { // Using closure for creating the number formatter
        let nf = NumberFormatter()
        nf.numberStyle = .none
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 0
        return nf
    }()
    
    func updateTextLabelValue() {
        if let value = textLabelValue {
            totalAmount.text = numberFormatter.string(from: NSNumber(value: value))
        } else {
            totalAmount.text = ""
        }
    }

    
    var textFieldValue: Int32? {
        didSet {
            updateTextLabelValue()
        }
    }
    
    

    @IBAction func textFieldEditingChanged(_ sender: UITextField)
    {
        if let text = sender.text, let value = Double(text) {
            textFieldValue = Int32(value)
        } else {
            textFieldValue = nil
        }

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Current Text: \(textField.text)")
        print("Replacement Text: \(string)")
        // if "textField.text" and "replacementString" have dot(.), then reject the entry, otherwise accept it
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementStringHasDecimalSeparator = string.range(of: ".")
        
        let characterSet = NSCharacterSet.init(charactersIn: "0123456789")
        let result = string.rangeOfCharacter(from: characterSet as CharacterSet, options: .caseInsensitive, range: string.startIndex..<string.endIndex)
        
        if existingTextHasDecimalSeparator != nil &&
            replacementStringHasDecimalSeparator != nil &&
            result != nil {
            return false
        }
        else {
            return true
        }
        
    }

    
    func alertControllerBackgroundTapped()
    {
        self.dismiss(animated: true, completion: nil)
    }

    var webCC : CCWebViewController?

    @IBAction func donateActionButton(_ sender: Any)
    {
        let title = selectLocationButton.titleLabel?.text
        let totalKitsCount = self.iftarCountTextField.text

        
        if title == "Location"
        {
            let alert = UIAlertController(title: "Invalid Location", message: "Please Select Location", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if totalKitsCount == ""
        {
            let alert = UIAlertController(title: "Invalid Amount", message: "Please Enter Valid Data", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let storyBoard : UIStoryboard = UIStoryboard (name: SAIStoryBoardIdentifiers.SAIStoryBoardMain , bundle: nil)
        webCC  = storyBoard.instantiateViewController(withIdentifier: "CCWebViewController") as? CCWebViewController
        webCC?.accessCode = self.accessCode
        webCC?.cancelUrl = self.cancelUrl
        webCC?.orderId = self.orderId
        webCC?.amount = self.totalAmount.text
        webCC?.currency = "INR"
        webCC?.merchantId = self.merchantId
        webCC?.redirectUrl =  self.redirectUrl
        webCC?.cancelUrl = self.cancelUrl
        webCC?.rsaKeyUrl = self.rsaKeyUrl
        
        webCC?.delivery_address = selectLocationButton.titleLabel?.text
        webCC?.merchant_param2 = "Eid Kit"
        webCC?.merchant_param3 = "General"
        webCC?.merchant_param4 = iftarCountTextField.text
        webCC?.merchant_param5 = UserDefaults.standard.integer(forKey: "UserID")
        
        self.present(webCC!, animated: true, completion: nil)

    }
    
    @IBAction func dimissViewController(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
}
