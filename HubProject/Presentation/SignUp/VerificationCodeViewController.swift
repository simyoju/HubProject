//
//  VerificationCodeViewController.swift
//  HubProject
//
//  Created by 심효주 on 2022/11/06.
//

import UIKit
import RxSwift
import RxCocoa

class VerificationCodeViewController : OneTextFieldViewController {
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    
    var signUpEamil: String?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationItem.backButtonTitle = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAttribute()
        setupDelegate()
        setupBind()
    }
    
    func setupAttribute(){
        mainTextField.placeholder = "이메일로 발송된 인증 번호를 입력해주세요."
        mainTextField.keyboardType = .numberPad
    }
    
    func setupDelegate(){
        mainTextField.delegate = self
    }
}

extension VerificationCodeViewController {
    func setupBind(){
        bottomButton.rx.tap
            .bind {
                self.moveToNext()
            }
            .disposed(by: disposeBag)
    }
    
    func moveToNext(){
        let nextVC = EnterPasswordViewController()
        guard let email = self.signUpEamil else { return }
        nextVC.signUpEamil = email
        self.navigationController?.pushViewController(nextVC, animated: false)
    }
}

extension VerificationCodeViewController: UITextFieldDelegate {
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


