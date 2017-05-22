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
        
        // Set the title of the View Controller 
        if eidVC
        {
            VCTitle.text = "Edit Kits at 600/-"
        }
        if monthlyVC
        {
            VCTitle.text = "Monthly Kits at 2000/-"
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
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Sallam2")
/*
        let a = self.iftarCountTextField.text
        let conversionRate = 70
        let b = Int(a!)! * conversionRate //use Double(a!)! instead of Int(a!)! if your are using a floating point value for "conversionRate" variable.
        totalAmount.text = ("\(b)")
 */
                return true;
    }
    
    func alertControllerBackgroundTapped()
    {
        self.dismiss(animated: true, completion: nil)
    }
}
