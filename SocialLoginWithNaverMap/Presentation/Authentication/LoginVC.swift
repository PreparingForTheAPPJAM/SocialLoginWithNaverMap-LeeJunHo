//
//  LoginViewController.swift
//  SocialLoginWithNaverMap
//
//  Created by Junho Lee on 2022/06/24.
//

import UIKit

final class LoginVC: BaseVC, Storyboarded {
    
    static var storyboard: Storyboards = .login
    
    // MARK: - Properties
    
    
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
    
    
    // MARK: - UI & Layout
    
}

