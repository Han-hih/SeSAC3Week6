//
//  Extension+UIViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/24.
//

import UIKit

extension UIViewController {
    
    enum TransitionStyle {
        case present // 네비게이션 없이 present
        case presentNavigaition //네비게이션 임베드 된 present
        case presentFullNavigation //네비게이션 임베드 된 fullscreen present
        case push
    }
    
    /*
     "고래밥" > String
     String > String.self(메타타입) > String.Type(구조체나 클래스를 가리킬 때)
     T로 들어오게 되면 ()가 붙은 상위 버전으로 들어온다. .Type을 붙여줘야 한다.
     */
    func transition<T: UIViewController>(viewController: T.Type,storyboard: String, style: TransitionStyle) {
            let sb = UIStoryboard(name: storyboard, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: String(describing: viewController)) as? T else {
            return
        }
        present(vc, animated: true)
        
        switch style {
        case .present:
            present(vc, animated: true)
        case .presentNavigaition:
            let nav = UINavigationController(rootViewController: vc)
            present(nav, animated: true)
        case .presentFullNavigation:
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        case .push:
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    // 모든 ui 들이 uiview를 상속받아서 채택되어 있다.
    //Type Parameter(첫글자를 따서 T라고 많이 쓴다.): 타입의 종류는 알려주지 않지만, 모두 같은 타입이 들어갈 것을 암시. 플레이스 홀더와 같은 역할
    //Type Constraints : 클래스 제약, 프로토콜 제약
    //UpperCased(U)
    func configureBorder<T: UIView>(view: T) {
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
    
    
    
    // Generic: 타입에 유연하게 대응하기 위한 요소
    // 코드 중복과 재사용에 대응하기가 좋아서 추상적인 표현 가능
    func sum<T: AdditiveArithmetic>(a: T, b: T) -> T {
        return a + b
    }
    
    func sumInt(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func sumDouble(a: Double, b: Double) -> Double {
        return a + b
    }
    
    func sumFloat(a: Float, b: Float) -> Float {
        return a + b
    }
}
