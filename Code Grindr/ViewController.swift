//
//  ViewController.swift
//  Code Grindr
//
//  Created by Nom Phan on 3/19/20.
//  Copyright © 2020 Nom Phan. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rememberMeButton: UIButton!
    @IBOutlet weak var forgorPasswordButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
        setupLoginButton()
        setupemailTextField()
        setuppasswordTextField()
        setupRememberMeButton()
        setupforgorPasswordButton()
        setupsignupButton()
    }
    // remember me function
    @IBAction func checkBoxTapped(_ sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    // forgot password function
    @IBAction func forgotPassword(_ sender:UIButton) {
        if sender.isSelected {
            sender.isSelected = false
        } else {
            sender.isSelected = true
        }
    }
    // UI textfield delegate methods
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
    func validateFields() -> String? {
        if (emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
            return "Please fill all the fields."
        }
        return nil
    }
    func showError(_ message:String) {
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    func transitionToHome() {
        let homeViewController = storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeViewController
            view.window?.rootViewController = homeViewController
            view.window?.makeKeyAndVisible()
        }
    @IBAction func loginTapped(_ sender: Any) {
    // Validates all the fields
            let error = validateFields()
            
            if error != nil {
                showError(error!)
            }
            else {
                // Create cleaned versions of the data
                let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                // Sign in the user
                Auth.auth().signIn(withEmail: email, password: password)
                { (result, error) in
                    if error != nil {
                        self.errorLabel.text = error!.localizedDescription
                        self.errorLabel.alpha = 1
                    }
                    else {
                        self.transitionToHome()
                    }
                }
            }

        }
    
}
