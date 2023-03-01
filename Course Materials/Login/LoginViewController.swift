//
//  LoginViewController.swift
//  Course Materials
//
//  Created by Matt Beaney on 27/02/2023.
//

import UIKit

class LoginViewController: UIViewController {
	
	@IBOutlet var container: UIView!
	
	@IBOutlet var logo: UIImageView!
	
	@IBOutlet var usernameTxtField: UITextField!
	@IBOutlet var passwordTxtField: UITextField!
	
	@IBOutlet var signInBtn: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.styleSubViews()
	}
	
	private func styleSubViews() {
		
		// Style container
		self.container.layer.cornerRadius = 12.0
		self.container.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
		self.container.layer.shadowColor = UIColor.black.cgColor
		self.container.layer.shadowRadius = 1.0
		self.container.layer.shadowOpacity = 0.7
		
		// Style sign in button
		self.signInBtn.backgroundColor = .red
		self.signInBtn.tintColor = .white
		self.signInBtn.layer.cornerRadius = 12.0
	}
}
