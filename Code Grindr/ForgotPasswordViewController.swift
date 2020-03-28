//
//  ForgotPasswordViewController.swift
//  Code Grindr
//
//  Created by Nom Phan on 3/23/20.
//  Copyright © 2020 Nom Phan. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        setupemailTextField()
        setupResetButton()

    }
    func setupemailTextField() {
        emailTextField.borderStyle = .none
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: emailTextField.frame.height - 1, width: emailTextField.frame.width, height: 1.0)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        emailTextField.layer.addSublayer(bottomLine)
    }
    func setupResetButton() {
        resetButton.layer.cornerRadius = 15.0
        resetButton.tintColor = UIColor.white
        resetButton.backgroundColor = UIColor.init(red: 181/255, green: 163/255, blue: 238/255, alpha: 100)
    }
    func textFieldShouldReturn (_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        return true
    }
}
