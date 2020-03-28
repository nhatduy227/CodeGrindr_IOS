//
//  Uisetup.swift
//  Code Grindr
//
//  Created by Nom Phan on 3/19/20.
//  Copyright © 2020 Nom Phan. All rights reserved.
//

import UIKit

extension ViewController {
    func setupLoginButton() {
            loginButton.layer.cornerRadius = 15.0
            loginButton.tintColor = UIColor.white
            loginButton.backgroundColor = UIColor.init(red: 181/255, green: 163/255, blue: 238/255, alpha: 100)
        }
        func setupemailTextField() {
            emailTextField.leftViewMode = UITextField.ViewMode.always
            //setup icon to the left side
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            let image = UIImage(named: "icons8-user-50")
            imageView.image = image
            emailTextField.leftView = imageView
            emailTextField.tintColor = UIColor.lightGray
            //set up border style
            emailTextField.borderStyle = .none
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0.0, y: emailTextField.frame.height - 1, width: emailTextField.frame.width, height: 1.0)
            bottomLine.backgroundColor = UIColor.lightGray.cgColor
            emailTextField.layer.addSublayer(bottomLine)
        }
        func setuppasswordTextField() {
            passwordTextField.leftViewMode = UITextField.ViewMode.always
            //setup icon to the left side
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            let image = UIImage(named: "icons8-lock-50")
            imageView.image = image
            passwordTextField.leftView = imageView
            passwordTextField.tintColor = UIColor.lightGray
            //set up border style
            passwordTextField.borderStyle = .none
            let bottomLine = CALayer()
            bottomLine.frame = CGRect(x: 0.0, y: passwordTextField.frame.height - 1, width: passwordTextField.frame.width, height: 1.0)
            bottomLine.backgroundColor = UIColor.lightGray.cgColor
            passwordTextField.layer.addSublayer(bottomLine)
        }
        
        func setupRememberMeButton() {
            rememberMeButton.tintColor = UIColor.init(red: 181/255, green: 163/255, blue: 238/255, alpha: 100)
        }
        func setupforgorPasswordButton() {
        forgorPasswordButton.tintColor = UIColor.init(red: 181/255, green: 163/255, blue: 238/255, alpha: 100)
        }
        func setupsignupButton() {
            let text = NSMutableAttributedString(string: "Already has an account ? ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
            let subtext = NSMutableAttributedString(string: "Sign Up here", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
            text.append(subtext)
            signupButton.setAttributedTitle(text, for: UIControl.State.normal)
            signupButton.tintColor = UIColor.init(red: 181/255, green: 163/255, blue: 238/255, alpha: 100)
        }

}
