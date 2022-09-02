//
//  LoginView.swift
//  JZGDemo
//
//  Created by HuangSenhui on 2022/9/1.
//

import Foundation

/// 提供更新UI的方法（反馈结果）
protocol LoginView: AnyObject {
	func setAvater(gender: Int)
	func setButton(isEnable: Bool)
	func login()
	func showToas(string: String)
}
