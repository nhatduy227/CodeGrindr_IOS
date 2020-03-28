//
//  SignUpUIsetup.swift
//  Code Grindr
//
//  Created by Nom Phan on 3/23/20.
//  Copyright © 2020 Nom Phan. All rights reserved.
//

import UIKit

extension SignUpViewController {
    func setupfirstnameTextField() {
        firstnameTextField.borderStyle = .none
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: firstnameTextField.frame.height - 1, width: firstnameTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        firstnameTextField.layer.addSublayer(bottomLine)
    }
    func setuplastnameTextField() {
        lastnameTextField.borderStyle = .none
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: lastnameTextField.frame.height - 1, width: lastnameTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        lastnameTextField.layer.addSublayer(bottomLine)
    }
    func setupemailTextField() {
        emailTextField.borderStyle = .none
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: emailTextField.frame.height - 1, width: emailTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        emailTextField.layer.addSublayer(bottomLine)
    }
    func setuppasswordTextField() {
        //set up border style
        passwordTextField.borderStyle = .none
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: passwordTextField.frame.height - 1, width: passwordTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        passwordTextField.layer.addSublayer(bottomLine)
    }
    func setupretypePasswordTextField() {
        retypePasswordTextField.borderStyle = .none
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: retypePasswordTextField.frame.height - 1, width: retypePasswordTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        retypePasswordTextField.layer.addSublayer(bottomLine)
    }
    func setupNextButton() {
        nextButton.layer.cornerRadius = 15.0
        nextButton.tintColor = UIColor.white
        nextButton.backgroundColor = UIColor.init(red: 181/255, green: 163/255, blue: 238/255, alpha: 100)
    }
}

