//
//  VerificationCodeViewController.swift
//  HubProject
//
//  Created by 심효주 on 2022/11/06.
//

import UIKit

class VerificationCodeViewController : OneTextFieldViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()
        setupDelegate()
    }
    
    func setupAttribute(){
        mainTextField.placeholder = "이메일로 발송된 인증 번호를 입력해주세요."
    }
    
    func setupDelegate(){
        mainTextField.delegate = self
    }
}

extension VerificationCodeViewController: UITextFieldDelegate {
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


