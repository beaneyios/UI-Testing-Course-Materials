//
//  LoginViewController.swift
//  Course Materials
//
//  Created by Matt Beaney on 27/02/2023.
//

import UIKit
import Combine

class LoginViewController: UIViewController {
	
	@IBOutlet var containerView: UIView!
	
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
		self.containerView.addShadow()
		
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
