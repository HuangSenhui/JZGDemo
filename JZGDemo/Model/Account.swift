//
//  Account.swift
//  JZGDemo
//
//  Created by HuangSenhui on 2022/9/1.
//

import Foundation

class Account: Codable {
	var userName: String
	var password: String
	var gender: Gender
	
	init() {
		userName = ""
		password = ""
		gender = .male
	}
	
	func fetchInfo(username: String, callback: @escaping ()->Void) {
		DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
			if let num = Int(username) {
				self.gender = num % 2 == 0 ? .female : .male
				callback()
			}
		}
	}
}


extension Account {
	enum Gender: Codable {
		case male
		case female
	}
}

extension Account: CustomStringConvertible {
	var description: String {
		return "{userName=\(userName), password=\(password)}"
	}
}
