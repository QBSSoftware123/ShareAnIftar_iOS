//
//  SAIIftarDonateViewController.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 06/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIIftarDonateViewController: SAIViewController , UITextFieldDelegate {
    
    // IBOutlet for Select Location Button
    @IBOutlet weak var selectLocationButton: UIButton!
    
    // Flag to Check Eid ViewController
    var eidVC : Bool = false
    
    // Flag to Check Monthly ViewController
    var monthlyVC : Bool = false
    
    // View Controller Title
    @IBOutlet weak var VCTitle: UILabel!
    
    @IBOutlet weak var totalAmount: UILabel!
    
    @IBOutlet weak var iftarCountTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the view with blue gradient color.
        addBlueGradientColor(GradientColor: SAIGradientColorConstants.SAIBlueGradient)
        
        self.iftarCountTextField.delegate = self
        // Round Edged Button
        selectLocationButton.layer.cornerRadius = 5
        selectLocationButton.layer.borderWidth = 1
        selectLocationButton.layer.borderColor = SAIColorConstants.SAIAppColor.cgColor
        
        totalAmount.layer.cornerRadius = 5
        totalAmount.layer.borderWidth = 1
        totalAmount.layer.borderColor = SAIColorConstants.SAIAppColor.cgColor
        
        iftarCountTextField.keyboardType = UIKeyboardType.numberPad

        
        // Set the title of the View Controller 
        if eidVC
        {
            VCTitle.text = "Edit Kits at 600/-"
            totalAmount.text = "600"
        }
        if monthlyVC
        {
            VCTitle.text = "Monthly Kits at 2000/-"
            totalAmount.text = "2000"
        }
        
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
    
    
    func updateTextLabelValue() {
        if let value = textLabelValue {
            totalAmount.text = numberFormatter.string(from: NSNumber(value: value))
        } else {
            totalAmount.text = ""
        }
    }
    
    var textLabelValue: Int32? {
        if let value = textFieldValue {
            if eidVC
            {
                return value * 600
            }
            if monthlyVC
            {
                return value * 2100
            }
            return value * 70
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

    
    var textFieldValue: Int32? {
        didSet {
            updateTextLabelValue()
        }
    }

    // MARK: Delegate functions
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("Current Text: \(textField.text)")
//        print("Replacement Text: \(string)")
//        // if "textField.text" and "replacementString" have dot(.), then reject the entry, otherwise accept it
//        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
//        let replacementStringHasDecimalSeparator = string.range(of: ".")
//        
//        let characterSet = NSCharacterSet.init(charactersIn: "0123456789")
//        let result = string.rangeOfCharacter(from: characterSet as CharacterSet, options: .caseInsensitive, range: string.startIndex..<string.endIndex)
//        
//        if existingTextHasDecimalSeparator != nil &&
//            replacementStringHasDecimalSeparator != nil &&
//            result != nil {
//            return false
//        }
//        else {
//            return true
//        }
//    }
//  
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
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
}
