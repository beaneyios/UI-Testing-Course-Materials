//
//  LoginViewController.swift
//  Course Materials
//
//  Created by Matt Beaney on 27/02/2023.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
	
	@IBOutlet var container: UIView!
	
	@IBOutlet var logo: UIImageView!
	
	@IBOutlet var usernameTxtField: UITextField!
	@IBOutlet var passwordTxtField: UITextField!
	
	@IBOutlet var signInBtn: UIButton!
	
	var viewModel: LoginViewModel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.styleSubViews()
	}
	
	@IBAction func didTapSignIn(_ sender: Any) {
		self.viewModel.login()
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

extension UITextField {
	func textPublisher() -> AnyPublisher<String, Never> {
		NotificationCenter.default
			.publisher(for: UITextField.textDidChangeNotification, object: self)
			.map { ($0.object as? UITextField)?.text  ?? "" }
			.eraseToAnyPublisher()
	}
}
