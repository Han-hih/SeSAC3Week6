//
//  Example2ViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/22.
//

import UIKit
//제일 상단뷰: x버튼, 선물하기버튼, 네모버튼?, 설정버튼

//하단뷰: 프로필사진, 이름레이블, 상태 메시지, 선, (나와의 채팅, 프로필 편집, 카카오스토리)
class Example2ViewController: UIViewController {

    let topView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let closeButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "multiply"), for: .normal)
        
        return button
    }()
    
    let giftButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gift"), for: .normal)
        
        return button
    }()
    
    let sendButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        
        return button
    }()
    
    let settingButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bonjour"), for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        [topView, closeButton, settingButton, sendButton, giftButton ].forEach {
            view.addSubview($0)
        }
        
        setAutoLayout()
        
    }
    
    func setAutoLayout() {
        topView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        closeButton.snp.makeConstraints { make in
            make.leading.verticalEdges.equalTo(topView)
            make.width.equalTo(30)
        }
        
        settingButton.snp.makeConstraints { make in
            make.trailing.verticalEdges.equalTo(topView)
            make.width.equalTo(closeButton)
        }
        
        sendButton.snp.makeConstraints { make in
            make.verticalEdges.equalTo(topView)
            make.width.equalTo(closeButton)
            make.trailing.equalTo(settingButton.snp_leadingMargin).offset(-20)
        }
        
        giftButton.snp.makeConstraints { make in
            make.verticalEdges.equalTo(topView)
            make.width.equalTo(closeButton)
            make.trailing.equalTo(sendButton.snp_leadingMargin).offset(-20)
        }
        
    }
   

}
