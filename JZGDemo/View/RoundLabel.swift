//
//  RoundLabel.swift
//  JZGDemo
//
//  Created by HuangSenhui on 2022/9/1.
//

import UIKit

@IBDesignable class RoundLabel: UILabel {

    override func draw(_ rect: CGRect) {
		super.draw(rect.inset(by: UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)))
		
    }
    
	func show(text: String) {
		self.text = text
		isHidden = false
		
		DispatchQueue.main.asyncAfter(deadline: .now()+2) {
			self.isHidden = true
		}
	}

}
