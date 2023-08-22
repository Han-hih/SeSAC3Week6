//
//  SnapViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/22.
//

import UIKit
import SnapKit

/*
 addSubView
 superView
 offset inset
 RTL: leading vs left
 */

class SnapViewController: UIViewController {

    let redView = UIView()
    let whiteView = UIView()
    let blueView = UIView()
    let yellowView = UIView()
    
    // 디바이스 정중앙에 위치, width height 200
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        //밑에 처럼 옐로우뷰를 먼저 가져오면 뒤에 화이트뷰에 겹쳐져서 가려진다.
//        view.addSubview(yellowView)
        view.addSubview(redView)
        redView.backgroundColor = .red
        redView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(150)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        view.addSubview(whiteView)
        whiteView.backgroundColor = .white
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(200)
        }
        
        view.addSubview(blueView)
        blueView.backgroundColor = .blue
        blueView.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
        
        blueView.addSubview(yellowView)
        yellowView.backgroundColor = .yellow
        yellowView.snp.makeConstraints { make in
//            make.size.equalTo(150)
            // 내가 속한 상단뷰 기준
//            make.leading.top.equalToSuperview()
            make.edges.equalTo(blueView).offset(-50)
        }
        
    }
    



}
