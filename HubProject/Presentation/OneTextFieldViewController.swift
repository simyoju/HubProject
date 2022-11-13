//
//  OneTextFieldViewController.swift
//  HubProject
//
//  Created by 심효주 on 2022/11/06.
//

import UIKit
import SnapKit
import Then

class OneTextFieldViewController: UIViewController {
    // MARK: - UI Components
    let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "HubLogo")
    }
    
    let mainTextField = UITextField().then {
        $0.addLeftPadding()
        
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor(named: "HubGrey04")?.cgColor
        
        $0.layer.cornerRadius = 14
        
//        $0.placeholder = "    이메일을 입력해주세요"
        
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
    
    // MARK: - View LifeCycles
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainTextField.becomeFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
//        mainTextField.becomeFirstResponder()
        
        setView()
        setLayout()
        
        mainTextField.inputAccessoryView = bottomButton
    }
}

extension OneTextFieldViewController {
    func setView(){
        [
            logoImageView,
            mainTextField,
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
                .offset(height * 0.15270)
            
            $0.centerX.equalToSuperview()
            
            $0.width.equalTo(width * 0.64)
            $0.height.equalTo(height * 0.10545)
        }
        
        mainTextField.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom)
                .offset(height * 0.09405)
            $0.leading.trailing.equalToSuperview().inset(16)
            
            $0.height.equalTo(44)
        }
        
        bottomButton.snp.makeConstraints{
            $0.top.equalTo(mainTextField.snp.bottom)
                .offset(80)
            $0.centerX.equalToSuperview()
            
            $0.leading.trailing.equalTo(mainTextField)
            $0.height.equalTo(52)
        }
    }
}

extension OneTextFieldViewController {
    func focusInTextField(){
        mainTextField.layer.borderColor = UIColor(named: "HubPrimary")?.cgColor
    }
    
    func focusOutTextField(){
        mainTextField.layer.borderColor = UIColor(named: "HubGrey04")?.cgColor
    }
}
