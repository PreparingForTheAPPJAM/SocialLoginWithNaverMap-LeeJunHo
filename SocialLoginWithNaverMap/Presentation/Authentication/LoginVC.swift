//
//  LoginViewController.swift
//  SocialLoginWithNaverMap
//
//  Created by Junho Lee on 2022/06/24.
//

import UIKit

import SnapKit

final class LoginVC: BaseVC, Storyboarded {
    
    static var storyboard: Storyboards = .login
    
    // MARK: - Properties
    
    private lazy var loginButton: UIButton = {
        let bt = UIButton()
        bt.addAction(UIAction(handler: { _ in
            self.presentMainMapVC()
        }), for: .touchUpInside)
        bt.setTitle("로그인", for: .normal)
        bt.setBackgroundColor(.lightGray, for: .normal)
        return bt
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Bind
    
    // MARK: - Custom Methods
    
    private func presentMainMapVC() {
        let nextVC = MainMapVC.instantiate()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
    // MARK: - UI & Layout
    
    override func setLayout() {
        view.addSubviews(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalTo(80)
            make.height.equalTo(50)
        }
    }
}
