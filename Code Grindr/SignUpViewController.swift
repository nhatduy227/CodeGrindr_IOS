//
//  SignUpViewController.swift
//  Code Grindr
//
//  Created by Nom Phan on 3/23/20.
//  Copyright © 2020 Nom Phan. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstnameTextField.delegate = self
        lastnameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        retypePasswordTextField.delegate = self
        setupfirstnameTextField()
        setuplastnameTextField()
        setupemailTextField()
        setuppasswordTextField()
        setupretypePasswordTextField()
        setupNextButton()
    }
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        firstnameTextField.resignFirstResponder()
        lastnameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        retypePasswordTextField.resignFirstResponder()
        return true
    }
    func validateFields() -> String? {
        // Check that all fields are filled in
        if  (firstnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            retypePasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "") {
                return "Please fill all the fields."
        }
        // Check if the password is matched
        else if (passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) != retypePasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)) {
            return "Please check if passwords are matched"
        }
        
        return nil
    }
    @IBAction func nextTapped(_ sender: Any) {
        // Validate fields
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            // Create cleaned versions of the data
            let firstName = firstnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastnameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

            
            // Create a user profile
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                // Check for errors
                if err != nil {
                    self.showError("Error creating user")
                }
                else {
                    // Store user data
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["first_name":firstName,"last_name":lastName,"uid":result!.user.uid]) { (error) in
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }
                    // Transition to the home screen
                    self.transitionToHome()
                }
            }
        }
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
    
}
