//
//  SAIInitiativesViewController.swift
//  ShareAnIftar
//
//  Created by Dilgir Siddiqui on 5/21/17.
//  Copyright © 2017 QBS. All rights reserved.
//

import UIKit

class SAIInitiativesViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
   /*
    1. Sharealife.in
    2. Bookmyiftars.com
    3. Donateazy.com
    4. NGO360.org
    5.Ummathjobs.com
    6.Ummath.com
    7. Quatriz.com
    */
    /* share_a_life, bmi , donateazy , ngo_360 , ummath_jobs , ummath_com , QBS  */
    let images = ["share_a_life","bmi","donateazy","ngo_360","ummath_jobs","ummath_com","QBS"]
    
    let imagesName = ["Sharealife","Bookmyiftar","Donateazy","NGO360","Ummathjobs","Ummath","Quatriz"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
                tableView.register(UINib(nibName: "SAIInitiativesTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return images.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : SAIInitiativesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SAIInitiativesTableViewCell
        cell.companyImage.image = UIImage(named:images[indexPath.row])
        cell.someLabel.text = imagesName [indexPath.row]
        return cell
    }
    @IBAction func dismissVC(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        if indexPath.row == 0
        {
            self.openURL(orgURL: "http://www.Sharealife.in")
        }
        if indexPath.row == 1
        {
            print("Alhamdulillah")
             self.openURL(orgURL: "http://www.Bookmyiftar.com")
        }
        if indexPath.row == 2
        {
            print("Alhamdulillah")
            self.openURL(orgURL: "http://www.Donateazy.com")
        }
        
        if indexPath.row == 3
        {
            print("Alhamdulillah")
            self.openURL(orgURL: "http://www.NGO360.org")
        }
        
        if indexPath.row == 4
        {
            print("Alhamdulillah")
            self.openURL(orgURL: "http://www.Ummathjobs.com")
        }
        if indexPath.row == 5
        {
            print("Alhamdulillah")
            self.openURL(orgURL: "http://www.Ummath.com")
        }
        if indexPath.row == 6
        {
            print("Alhamdulillah")
            self.openURL(orgURL: "http://www.Quatriz.com")
        }
    }
    
    func openURL (orgURL: String?)
    {
        if let url = URL(string: orgURL!) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        
    }
}
