//
//  AroundMovieTheaterViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/23.
//

import UIKit
import MapKit
import CoreLocation
import SnapKit


class AroundMovieTheaterViewController: UIViewController {
    
    
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    
    
    let filetrButton = UIButton()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        locationManager.delegate = self
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
//        filetrButton.tintColor = .black
//        filetrButton.addTarget(self, action: #selector(filterButtonTapped), for: .touchUpInside)
        
        
        checkDeviceLocationAuthorization()

    }
    
    
    
    
    // 클릭시 액션시트 띄우기
    @objc func filterButtonTapped() {
        
    }
    
    
    
    
    func showRequestLocationServiceAlert() {
      let requestLocationServiceAlert = UIAlertController(title: "위치정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호'에서 위치 서비스를 켜주세요.", preferredStyle: .alert)
      let goSetting = UIAlertAction(title: "설정으로 이동", style: .destructive) { _ in
          if let appSetting = URL(string: UIApplication.openSettingsURLString) {
              UIApplication.shared.open(appSetting)
          }
      }
      let cancel = UIAlertAction(title: "취소", style: .default)
      requestLocationServiceAlert.addAction(cancel)
      requestLocationServiceAlert.addAction(goSetting)
      
      present(requestLocationServiceAlert, animated: true, completion: nil)
    }
    
    
    func checkDeviceLocationAuthorization() {
        
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                
                let authorization: CLAuthorizationStatus
                if #available(iOS 14.0, *) {
                    authorization = self.locationManager.authorizationStatus
                } else {
                    authorization = CLLocationManager.authorizationStatus()
                }
                
                print(authorization)
                DispatchQueue.main.async {
                    self.checkCurrentLocationAuthorization(status: authorization)
                }
            } else {
                print("위치 서비스가 꺼져 있어서 위치 권한 요청을 못합니다.")
            }
        }
        
        
    }
    
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        // 지도 중심 기반으로 보여질 범위 설정
        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        
        mapView.setRegion(region, animated: true)
        
        //지도에 어노테이션 추가
//        let annotation = MKPointAnnotation()
//        annotation.title = "영캠이에요"
//        annotation.coordinate = center
//
//        mapView.addAnnotation(annotation)
        
        
    }
    
    func checkCurrentLocationAuthorization(status: CLAuthorizationStatus) {
        print("check", status)
        
        let value: Optional<String>
        
        
        
        switch status {
            //
        case .notDetermined:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization() // 보여지는 얼럿을 띄울 수 있는 기능
            
        case .restricted:
            print("restricted")
        case .denied:
            print("denied")
            showRequestLocationServiceAlert() // 적당한 위치가 어디인지 고민해보기
            let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
            setRegionAndAnnotation(center: center)
        case .authorizedAlways:
            print("authorizedAlways")
        case .authorizedWhenInUse:
            print("authorizedWhenInUse")
            //didUpdateLocation 메서드 실행
            locationManager.startUpdatingLocation()
        case .authorized:
            print("authorized")
        @unknown default: print("default")
        }
    }
    
    
}
extension AroundMovieTheaterViewController: CLLocationManagerDelegate {
    // 사용자의 위치를 성공적으로 가지고 옴
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
            setRegionAndAnnotation(center: coordinate)
        }
        locationManager.stopUpdatingLocation()
    }
    //위치를 못 가져옴
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    //권한이 바꼈을 때
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    
    }
    
    
}
extension AroundMovieTheaterViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print(#function)
    }
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(#function)
    }
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        print(#function)
//    }
    
    
    
}
