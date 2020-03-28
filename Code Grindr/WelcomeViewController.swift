//
//  WelcomeViewController.swift
//  Code Grindr
//
//  Created by Nom Phan on 3/23/20.
//  Copyright © 2020 Nom Phan. All rights reserved.
//


import UIKit

class WelcomeViewController: UIViewController, UITextFieldDelegate  {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rememberMeButton: UIButton!
    @IBOutlet weak var forgorPasswordButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
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
    @IBAction func loginTapped(_ sender: Any) {
        
    }
}
