//
//  ViewController.swift
//  JZGDemo
//
//  Created by HuangSenhui on 2022/9/1.
//

//	TODO:
//	1. 输入用户名，头像自动显示
//	2. 用户名+密码+协议 满足是按钮可点击，否则给出对应提示

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var avatarImageView: UIImageView!
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var policyButton: UIButton!
	@IBOutlet weak var loginButton: UIButton!
	@IBOutlet weak var toastView: RoundLabel!
	
	var presenter: LoginPresenter!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		presenter = LoginPresenter(view: self)
	}

	@IBAction func tappedLoginButton(_ sender: UIButton) {
		presenter.login()
	}
	
	@IBAction func tappedPolicyButton(_ sender: UIButton) {
		sender.isSelected.toggle()
		presenter.isCheckedPolicy = sender.isSelected
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)
		
		UIApplication.shared.sendAction(#selector(resignFirstResponder), to: nil, from: nil, for: nil)
	}
	
}

extension ViewController: UITextFieldDelegate {
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

		if textField == usernameTextField, !string.isEmpty {
			presenter.updateAvatar(username: string)
		}
		
		return true
	}
	func textFieldDidEndEditing(_ textField: UITextField) {
		guard let text = textField.text else { return }
		
		if textField == usernameTextField {
			presenter.setupAccount(username: text, password: nil)
		} else if textField == passwordTextField {
			presenter.setupAccount(username: nil, password: text)
		}
	}
}

extension ViewController: LoginView {
	func setButton(isEnable: Bool) {
		loginButton.backgroundColor = isEnable ? .link : .lightGray
	}
	
	func showToas(string: String) {
		toastView.show(text: string)
	}
	
	func login() {
		let vc = UIViewController()
		vc.title = "登录成功"
		vc.view.backgroundColor = .green
		navigationController?.pushViewController(vc, animated: true)
	}
	
	func setAvater(gender: Int) {
		avatarImageView.tintColor = gender == 1 ? .blue : .red
	}
	
}
