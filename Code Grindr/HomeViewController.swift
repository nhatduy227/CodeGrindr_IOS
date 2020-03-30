//
//  HomeViewController.swift
//  Code Grindr
//
//  Created by Nom Phan on 3/24/20.
//  Copyright © 2020 Nom Phan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackgroundView()
        setupAvatarImageView()
        setupNameLabel()
        setupEmailLabel()
    }
}
