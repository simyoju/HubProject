//
//  EnterPasswordViewController.swift
//  HubProject
//
//  Created by 심효주 on 2022/11/13.
//

import Foundation

class EnterPasswordViewController: TwoTextFieldViewController {
    // MARK: - Properties
    var signUpEamil: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()
        setupDelegate()
    }
    
    func setupAttribute(){
//        upTextField.placeholder = "이메일로 발송된 인증 번호를 입력해주세요."
        downTextField.placeholder = "비밀번호를 입력해주세요."
        guard let email = self.signUpEamil else { return }
        upTextField.text = email
        
    }
    
    func setupDelegate(){
//        mainTextField.delegate = self
    }
}
