//
//  ViewController.swift
//  LoginApp
//
//  Created by SubZero on 09.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Private properties
    private let user = User.getUserData()
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let userInformationVC = tabBarController.viewControllers?.first as! UserInformationViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
        userInformationVC.user = user
        aboutUserVC.user = user
//        userInformationVC.userName = self.userNameTextField.text ?? "No name"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func logInButton() {
        guard
            userNameTextField.text == user.name,
            passwordTextField.text == user.password
        else {
            showAlert(title: "Invalid login or password",
                      massage: "Please, enter correct login and password",
                      textField: passwordTextField)
            return
        }
        performSegue(withIdentifier: "logIn", sender: nil)
        
    }
    
    @IBAction func forgotNameUserAction() {
        showAlert(title: "Ooops!", massage: "Your name is \(user.name)")
    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(title: "Ooops!", massage: "Your password is \(user.password)")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    
}


//MARK: Alert Controller:
extension ViewController {
    private func showAlert(title: String, massage: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            textField?.text = nil
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

// MARK: Text Field Delegate
extension ViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        } else {
            logInButton()
        }
        return true
    }
    
}
