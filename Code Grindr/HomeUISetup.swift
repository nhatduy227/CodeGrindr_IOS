//
//  HomeUISetup.swift
//  Code Grindr
//
//  Created by Nom Phan on 3/28/20.
//  Copyright © 2020 Nom Phan. All rights reserved.
//

import UIKit

extension HomeViewController {
    func setupBackgroundView() {
        backgroundView.backgroundColor = UIColor.init(red: 181/255, green: 163/255, blue: 238/255, alpha: 100)
    }
    func setupAvatarImageView() {
        self.avatarImageView.cropAsCircleWithBorder(borderColor: UIColor.white, strokeWidth: 3)
        avatarImageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        avatarImageView.addGestureRecognizer(tapGesture)
    }
    @objc func presentPicker() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true,completion: nil)
    }
    func setupNameLabel() {
        nameLabel.textAlignment = .center
        nameLabel.text = "Eddie Brock"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 26)
        nameLabel.textColor = .black
    }
    func setupEmailLabel() {
        emailLabel.textAlignment = .center
        emailLabel.text = "venom@gmail.com"
        emailLabel.font = UIFont.systemFont(ofSize: 18)
        emailLabel.textColor = .black
    }
}

extension UIImageView {
    func cropAsCircleWithBorder(borderColor : UIColor, strokeWidth: CGFloat)
    {
        var radius = min(self.bounds.width, self.bounds.height)
        var drawingRect : CGRect = self.bounds
        drawingRect.size.width = radius
        drawingRect.origin.x = (self.bounds.size.width - radius) / 2
        drawingRect.size.height = radius
        drawingRect.origin.y = (self.bounds.size.height - radius) / 2

        radius /= 2

        var path = UIBezierPath(roundedRect: drawingRect.insetBy(dx: strokeWidth/2, dy: strokeWidth/2), cornerRadius: radius)
        let border = CAShapeLayer()
        border.fillColor = UIColor.clear.cgColor
        border.path = path.cgPath
        border.strokeColor = borderColor.cgColor
        border.lineWidth = strokeWidth
        self.layer.addSublayer(border)

        path = UIBezierPath(roundedRect: drawingRect, cornerRadius: radius)
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            avatarImageView.image = imageSelected
        }
        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            avatarImageView.image = imageOriginal
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
