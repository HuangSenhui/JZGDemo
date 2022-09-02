//
//  LoginViewPresenter.swift
//  JZGDemo
//
//  Created by HuangSenhui on 2022/9/1.
//

import Foundation

/// 对UI进行的操作（接受任务）
protocol LoginViewPresenter {
	
	init(view: LoginView)
	func updateAvatar(username: String)
	func updateButton()
}
