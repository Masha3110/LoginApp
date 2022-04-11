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
    
    //MARK: - Public properties
    var user: User!
    
    //MARK: - Public properties
private let primaryColor = UIColor(
    red: 210/255,
    green: 109/255,
    blue: 128/255,
    alpha: 1
)
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor:primaryColor, bottomColor: secondaryColor)
        userNameLabel.text = "Welcome, " + user.name
    }
    
    @IBAction func logOutAction() {
        dismiss(animated: true)
    }
}
extension UserInformationViewController {
    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0
        )
    }
}
