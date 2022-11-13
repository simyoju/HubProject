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
    
    let disposeBag = DisposeBag()
    
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
        bottomButton.rx.tap
            .bind {
                let nextVC = VerificationCodeViewController()
                self.navigationController?.pushViewController(nextVC, animated: false)
            }
            .disposed(by: disposeBag)
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

