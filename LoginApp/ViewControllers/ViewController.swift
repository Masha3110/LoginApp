//
//  ViewController.swift
//  LoginApp
//
//  Created by SubZero on 09.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInButton(_ sender: UIButton) {
        
    }
    
    @IBAction func forgotNameUserAction() {
        showAlert(title: "Ooops!", massage: "Your name is")

    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(title: "Ooops!", massage: "Your password is")

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUser" {
            let tabBarController = segue.destination as! UITabBarController
            let userInformationVC = tabBarController.viewControllers?.first as! UserInformationViewController
            userInformationVC.userName = self.userNameTextField.text ?? "No name"
        }
    }
    
    
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        let userInformationVC = segue.source as! UserInformationViewController
        userNameTextField.text = ""
        passwordTextField.text = ""
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

extension ViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
}
