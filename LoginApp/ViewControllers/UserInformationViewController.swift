//
//  UserInformationViewController.swift
//  LoginApp
//
//  Created by SubZero on 09.04.2022.
//

import UIKit

class UserInformationViewController: UIViewController {
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = "Welcome, " + userName
    }
    
    @IBAction func logOutAction() {
        dismiss(animated: true)
    }
    

}
