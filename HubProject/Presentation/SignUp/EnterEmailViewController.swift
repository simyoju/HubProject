//
//  EnterEmailViewController.swift
//  HubProject
//
//  Created by 심효주 on 2022/10/30.
//

import UIKit
import RxSwift
import RxCocoa

class EnterEmailViewController: OneTextFieldViewController {
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()
        setupDelegate()
        setupBind()
    }
    
    func setupAttribute(){
        mainTextField.placeholder = "이메일을 입력해주세요"
    }
    
    func setupDelegate(){
        mainTextField.delegate = self
    }
}

extension EnterEmailViewController {
    func setupBind(){
        setupTap()
    }
    
    func setupTap(){
        bottomButton.rx.tap
            .bind {
                self.moveToNext()
            }
            .disposed(by: disposeBag)
    }
    
    func moveToNext(){
        let nextVC = VerificationCodeViewController()
        guard let email = self.mainTextField.text else { return }
        nextVC.signUpEamil = email
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
}

extension EnterEmailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else { return false }
        if !text.isEmpty { moveToNext() }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.focusInTextField()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.focusOutTextField()
    }
}

