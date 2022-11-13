//
//  WelcomeToHubViewController.swift
//  HubProject
//
//  Created by 심효주 on 2022/11/13.
//

import UIKit
import SnapKit
import Then

class WelcomeToHubViewController: UIViewController {
    // MARK: - UI Components
    let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "WelcomeIcon")
    }
    
    let userLabel = UILabel().then{
        $0.textColor = UIColor(named: "HubPrimary")
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    
    let descriptionLabel = UILabel().then{
        $0.text = "HUB에 오신 걸 환영합니다!"
        $0.textColor = UIColor(named: "HubGrey15")
        
        $0.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    }
    
    let bottomButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        
        $0.backgroundColor = UIColor(named: "main")
        $0.layer.cornerRadius = 16
    }
    
    var signUpEamil: String?
    
    // MARK: - View LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupAttribute()
        
        setView()
        setLayout()
    }
    
    func setupAttribute(){
        guard let email = signUpEamil else { return }
        if email.contains("@") {
            userLabel.text = "\(email.split(separator: "@")[0])님"
        }
    }
    
}

extension WelcomeToHubViewController {
    func setView(){
        [
            logoImageView,
            userLabel,
            descriptionLabel,
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
                .offset(height * 0.06527)
            $0.centerX.equalToSuperview()
            
//            $0.width.equalTo(width * 0.82133)
//            $0.height.equalTo(height * 0.30049)
            $0.width.equalTo(308)
            $0.height.equalTo(244)
        }
        
        userLabel.snp.makeConstraints{
            $0.top.equalTo(logoImageView.snp.bottom)
                .offset(height * 0.05911)
            $0.centerX.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints{
            $0.top.equalTo(userLabel.snp.bottom)
                .offset(16)
            $0.centerX.equalToSuperview()
        }
        
        bottomButton.snp.makeConstraints{
            $0.top.equalTo(descriptionLabel.snp.bottom)
                .offset(height * 0.07881)
            $0.leading.trailing.equalToSuperview()
                .inset(16)
            $0.height.equalTo(52)
        }
        
    }
}
