//
//  EnterEmailViewController.swift
//  HubProject
//
//  Created by 심효주 on 2022/10/30.
//

import UIKit
import SnapKit
import Then

class EnterEmailViewController: OneTextFieldViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()
        setupDelegate()
    }
    
    func setupAttribute(){
        mainTextField.placeholder = "    이메일을 입력해주세요"
    }
    
    func setupDelegate(){
        mainTextField.delegate = self
    }
}

extension EnterEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.focusInTextField()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.focusOutTextField()
    }
}

