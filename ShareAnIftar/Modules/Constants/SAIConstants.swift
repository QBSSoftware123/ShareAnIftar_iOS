//
//  SAIConstants.swift
//  ShareAnIftar
//
//  Created by tauqeer ahmed khan on 05/04/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import Foundation
import UIKit


//MARK: - Color Constants
struct SAIColorConstants
{
    static let SAIAppColor = UIColor.init(colorLiteralRed: 33.0 / 255.0 , green: 150.0 / 255.0 , blue:  243.0 / 255.0, alpha: 1.0)
    static let SAIAppGreenColor = UIColor.init(colorLiteralRed: 27.0 / 255.0 , green: 170.0 / 255.0 , blue:  43.0 / 255.0, alpha: 1.0)
}

//MARK: - Story Board Constants
struct SAIStoryBoardIdentifiers
{
    static let SAIStoryBoardMain = "Main"
    static let SAIFundViewControllerIdentifier = "FundVC"
    static let SAIVideoViewControllerIdentifier = "VideoVC"
    static let SAIGemViewControllerIdentifier = "GemVC"
}

//MARK: - Segue Identifiers Constants
struct SAISegueIdentifiers
{
    static let SAIEidSegueIdentifiers = "EidVC"
    static let SAIMonthlySegueIdentifier = "MonthlyVC"
}

//MARK: - Gradient Color Constants
struct SAIGradientColorConstants
{
    static let SAIGreenGradient = "Green"
    static let SAIBlueGradient = "Blue"
}

//Picker Constants
let SAISortByPickerList = ["Bangalore","Bandhalli","Jagamkote","Mysore","Tumkur","Yadgir"]
