//
//  UITextField+Extension.swift
//  HubProject
//
//  Created by 심효주 on 2022/11/13.
//

import UIKit

extension UITextField {
    func addLeftPadding(){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
}
