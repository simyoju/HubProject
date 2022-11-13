//
//  EnterPasswordViewController.swift
//  HubProject
//
//  Created by 심효주 on 2022/11/13.
//

import UIKit
import RxSwift
import RxCocoa

class EnterPasswordViewController: TwoTextFieldViewController {
    // MARK: - Properties
    var signUpEamil: String?
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()
        setupDelegate()
        setupBind()
    }
    
    func setupAttribute(){
//        upTextField.placeholder = "이메일로 발송된 인증 번호를 입력해주세요."
        downTextField.placeholder = "비밀번호를 입력해주세요."
        guard let email = self.signUpEamil else { return }
        upTextField.text = email
        
        bottomButton.setTitle("회원가입", for: .normal)
    }
    
    func setupDelegate(){
        upTextField.delegate = self
        downTextField.delegate = self
    }
}

extension EnterPasswordViewController{
    func setupBind(){
        bottomButton.rx.tap
            .bind {
                self.moveToNext()
            }
            .disposed(by: disposeBag)
    }
    
    func moveToNext(){
        let nextVC = WelcomeToHubViewController()
        guard let email = self.signUpEamil else { return }
        nextVC.signUpEamil = email
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
}

extension EnterPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        if !text.isEmpty { moveToNext() }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.focusInTextField(textField)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.focusOutTextField(textField)
    }
}
