//
//  LocationViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/22.
//

import UIKit
import CoreLocation //1. 위치 임포트
import MapKit
import SnapKit

class LocationViewController: UIViewController {

    // 2. 위치 매니저 생성: 위치에 대한 대부분을 담당
    let locationManager = CLLocationManager()
    let mapView = MKMapView()
    let cafeButton = UIButton()
    let foodButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(50)
        }
        
        view.addSubview(cafeButton)
        cafeButton.backgroundColor = .red
        cafeButton.addTarget(self, action: #selector(cafeButtonClicked), for: .touchUpInside)
        cafeButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(50)
            make.size.equalTo(50)
            make.leading.equalTo(view).offset(100)
        }
        
        view.addSubview(foodButton)
        foodButton.backgroundColor = .blue
        foodButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(50)
            make.size.equalTo(50)
            make.trailing.equalTo(view).offset(-100)
        }
        
        view.backgroundColor = .white
        // 3. 위치 프로토콜 연결
        locationManager.delegate = self
        
        //info.plist <<< 얼럿
//        locationManager.requestWhenInUseAuthorization()
        // 뷰 계층에서 실행이 안될 수도 있다.
        checkDeviceLocationAuthorization()
        
        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        setRegionAndAnnotation(center: center)
        addAnnotaion(type:  0)
    }
    
  @objc func cafeButtonClicked() {
      
      
        addAnnotaion(type: 1) // 1
    }
    
    func addAnnotaion(type: Int) {
//        37.517857, 126.886714 // 컴포즈
//        37.517746, 126.887131 // 오밥
        
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 37.517857, longitude: 126.886714)
        
        mapView.removeAnnotation(annotation1)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 37.517746, longitude: 126.887131)
        
//        이 기능으로 핀이 여러개 있다가 하나만 보이게 해줄 수 있다.
        mapView.addAnnotations([annotation2])
        if type == 0 { // viewDidLoad
            mapView.addAnnotations([annotation1, annotation2])
        } else if type == 1 {
            
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations([annotation2])
        }
        
    }
    
    
    
    func setRegionAndAnnotation(center: CLLocationCoordinate2D) {
        // 지도 중심 기반으로 보여질 범위 설정
        let center = CLLocationCoordinate2D(latitude: 37.517829, longitude: 126.886270)
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 100, longitudinalMeters: 100)
        
        mapView.setRegion(region, animated: true)
        
        //지도에 어노테이션 추가
        let annotation = MKPointAnnotation()
        annotation.title = "영캠이에요"
        annotation.coordinate = center
        
        mapView.addAnnotation(annotation)
        
        
    }
    
    func showLocationSettingAlert() {
        let alert = UIAlertController(title: "위치 정보 이용", message: "위치 서비스를 사용할 수 없습니다. 기기의 '설정>개인정보 보호' 에서 위치 서비스를 켜주세요", preferredStyle: .alert)
        let goSetting = UIAlertAction(title: "설정으로 이동", style: .default) { _ in
            // 설정에서 직접적으로 앱 설정 화면에 들어간 적이 없다면
            // 한번도 설정 앱에 들어가지 않았거나, 막 다운받은 앱이라서
            // 설정 페이지로 넘어갈지, 설정 상세 페이지 결정 X
            if let appSetting = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSetting)
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(goSetting)
        alert.addAction(cancel)
        present(alert, animated: true)
        
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
            showLocationSettingAlert() // 적당한 위치가 어디인지 고민해보기
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
//4. 프로토콜 선언
extension LocationViewController: CLLocationManagerDelegate {
    
    //5. 사용자의 위치를 성공적으로 가지고 온 경우
    //didUpdateLocation은 한번만 실행되지 않는다, iOS 위치 업데이트가 필요한 시점에 알아서 여러번 호출
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        if let coordinate = locations.last?.coordinate {
            print(coordinate)
        }
        locationManager.stopUpdatingLocation()
    }
    
    //6. 사용자의 위치를 가지고 오지 못한 경우
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    //사용자의 권한 상태가 바뀔 때를 알려줌
    //거부했다가 설정에서 변경을 했거나, 혹은 notDetermined 상태에서 허용을 했거나
    //허용해서 위치를 가지고 오는 도중에, 설정에서 거부를 하고 앱으로 다시 돌아올 때 등
    //iOS14 이상
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        print(#function)
        checkDeviceLocationAuthorization()
    }
    
    //사용자의 권한 상태가 바뀔 때를 알려줌
    //iOS14 미만
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

    }
    
}

extension LocationViewController: MKMapViewDelegate {
    
    
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







