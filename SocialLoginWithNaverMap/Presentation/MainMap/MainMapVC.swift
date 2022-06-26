//
//  MainMapVC.swift
//  SocialLoginWithNaverMap
//
//  Created by Junho Lee on 2022/06/24.
//

import CoreLocation
import UIKit

import NMapsMap
import SnapKit

final class MainMapVC: BaseVC, Storyboarded {
    
    static var storyboard: Storyboards = .mainMap
    
    // MARK: - Properties
    
    private var locationManager = CLLocationManager()
    private var currentLatitude: Double?
    private var currentLongitude: Double?
    
    private lazy var naverMapView: NMFMapView = {
        let map = NMFMapView()
        return map
    }()
    
    private lazy var tempMarker: NMFMarker = {
        let mk = NMFMarker()
        mk.position = NMGLatLng(lat: 37.5670135, lng: 126.9783740)
        mk.mapView = naverMapView
        return mk
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .orange
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.coordinateCurrentAndMakeMarker()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Bind
    
    // MARK: - Custom Methods
    
    private func coordinateCurrentAndMakeMarker() {
        let locationManager = self.locationManager
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        let coordinates = locationManager.location?.coordinate
        self.currentLatitude = coordinates?.latitude
        self.currentLongitude = coordinates?.longitude
        
        if let currentX = currentLatitude,
           let currentY = currentLongitude {
            makeMarkerAt(aimX: currentX, aimY: currentY)
        }
        moveCameraToCurrentLoc()
    }
    
    private func makeMarkerAt(aimX: Double, aimY: Double) {
        tempMarker.position = NMGLatLng(lat: currentLatitude ?? 0, lng: currentLongitude ?? 0)
    }
    
    private func moveCameraToCurrentLoc() {
        if let currentX = currentLatitude,
           let currentY = currentLongitude {
            moveCameraTo(destinationX: currentX, destinationY: currentY)
        }
    }
    
    private func moveCameraTo(destinationX: Double, destinationY: Double) {
        naverMapView.moveCamera(
            NMFCameraUpdate(
                position: NMFCameraPosition(NMGLatLng(lat: destinationX, lng: destinationY), zoom: 12.0)),
            completion: nil)
    }
    
    // MARK: - UI & Layout
    
    override func setLayout() {
        view.addSubviews(naverMapView)
        
        naverMapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
