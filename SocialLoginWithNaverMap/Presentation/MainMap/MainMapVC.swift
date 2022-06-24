//
//  MainMapVC.swift
//  SocialLoginWithNaverMap
//
//  Created by Junho Lee on 2022/06/24.
//

import UIKit

import NMapsMap
import SnapKit

final class MainMapVC: BaseVC, Storyboarded {
    
    static var storyboard: Storyboards = .mainMap
    
    // MARK: - Properties
    
    private lazy var naverMapView: NMFMapView = {
        let map = NMFMapView()
        return map
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Bind
    
    // MARK: - Custom Methods
    
    // MARK: - UI & Layout
    
    override func setLayout() {
        view.addSubviews(naverMapView)
        
        naverMapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
