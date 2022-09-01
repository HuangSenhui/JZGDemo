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
	var isCheckedPolicy: Bool = false
	
	required init(view: LoginView, account: Account) {
		self.view = view
		self.account = account
	}
	
	func updateAvatar(username: String) {
		account.fetchInfo(username: username) {
			self.view.setAvater(gender: self.account.gender)
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
		view.login(account: account, isCheckedPolicy: isCheckedPolicy)
	}
}
