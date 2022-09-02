//
//  LoginPresenter.swift
//  JZGDemo
//
//  Created by HuangSenhui on 2022/9/1.
//

import Foundation


/// 桥梁（处理·沟通）
class LoginPresenter: LoginViewPresenter {
	unowned let view: LoginView
	let account: Account
    var isCheckedPolicy: Bool = false {
        didSet {
            updateButton()
        }
    }
	
	required init(view: LoginView) {
		self.view = view
		self.account = Account()
	}
	
	func updateAvatar(username: String) {
		account.fetchInfo(username: username) { [weak self] in
            guard let self = self else { return }
            self.view.setAvater(gender: self.account.gender.rawValue)
		}
	}
	
	func updateButton() {
		let isEnable = !account.userName.isEmpty && !account.password.isEmpty && isCheckedPolicy
		self.view.setButton(isEnable: isEnable)
	}
	
	func login() {
		print(account)
		
		guard !account.userName.isEmpty else {
			view.showToas(string: "账号不能为空")
			return
		}
		
		guard !account.password.isEmpty else {
			view.showToas(string: "密码不能为空")
			return
		}
		
		guard isCheckedPolicy else {
			view.showToas(string: "请阅读并同意用户协议")
			return
		}
		
		// 登录成功
		view.login()
	}
    
    func setupAccount(username: String?, password: String?) {
        if let username = username {
            account.userName = username
        }
        
        if let pw = password {
            account.password = pw
        }
        
        updateButton()
    }
}
