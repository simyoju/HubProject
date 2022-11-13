//
//  TwoTextFieldViewController.swift
//  HubProject
//
//  Created by 심효주 on 2022/11/13.
//

import UIKit
import SnapKit
import Then

class TwoTextFieldViewController: UIViewController {
    // MARK: - UI Components
    let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "HubLogo")
    }
    
    let upTextField = UITextField().then {
        $0.addLeftPadding()
        
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "HubGrey04")?.cgColor
        
        $0.layer.cornerRadius = 14
        
        $0.autocapitalizationType = .none
        $0.keyboardType = .emailAddress
    }
    
    let downTextField = UITextField().then {
        $0.addLeftPadding()
        
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "HubGrey04")?.cgColor
        
        $0.layer.cornerRadius = 14
        
        $0.autocapitalizationType = .none
        $0.keyboardType = .emailAddress
    }
    
    let bottomButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        $0.backgroundColor = UIColor(named: "main")
        $0.layer.cornerRadius = 16
    }
    
    // MARK: - view lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        downTextField.becomeFirstResponder()
        
        setView()
        setLayout()
        
        upTextField.inputAccessoryView = bottomButton
        downTextField.inputAccessoryView = bottomButton
    }
}

extension TwoTextFieldViewController {
    func setView(){
        [
            logoImageView,
            upTextField,
            downTextField,
            bottomButton
        ].forEach{
            view.addSubview($0)
        }
    }
    
    func setLayout(){
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        logoImageView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide)
                .offset(height * 0.06982)
            
            $0.centerX.equalToSuperview()
            
            $0.width.equalTo(width * 0.64)
            $0.height.equalTo(height * 0.10545)
        }
        
        upTextField.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom)
                .offset(height * 0.07389)
            $0.leading.trailing.equalToSuperview().inset(16)
            
            $0.height.equalTo(44)
        }
        
        downTextField.snp.makeConstraints{
            $0.top.equalTo(upTextField.snp.bottom)
                .offset(12)
            $0.leading.trailing.height.equalTo(upTextField)
        }
        
        bottomButton.snp.makeConstraints{
            $0.top.equalTo(downTextField.snp.bottom)
                .offset(80)
            $0.centerX.equalToSuperview()
            
            $0.leading.trailing.equalTo(downTextField)
            $0.height.equalTo(52)
        }
    }
}

extension TwoTextFieldViewController {
    func focusInTextField(_ textField: UITextField){
        textField.layer.borderColor = UIColor(named: "HubPrimary")?.cgColor
    }
    
    func focusOutTextField(_ textField: UITextField){
        textField.layer.borderColor = UIColor(named: "HubGrey04")?.cgColor
    }
}
