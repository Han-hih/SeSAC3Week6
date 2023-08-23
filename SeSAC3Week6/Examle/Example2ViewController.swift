//
//  Example2ViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/22.
//

import UIKit
//제일 상단뷰: x버튼, 선물하기버튼, 네모버튼?, 설정버튼

//하단뷰: 프로필사진, 이름레이블, 상태 메시지, 선, (나와의 채팅, 프로필 편집, 카카오스토리)
// MARK: - ui생성

class Example2ViewController: UIViewController {

    let topView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let bottomView = {
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
    
    let profileImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        
        return view
    }()
    
    let nameLabel = {
        let label = UILabel()
        label.text = "Inho"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    let lineView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        
        return view
    }()
    
    let messageButton = {
       let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 13)
        button.setTitle("나와의 채팅", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.tintColor = .white
        button.alignTextBelow(spacing: 10.0)
        
        return button
    }()
    
    let setProfileButton = {
        let button = UIButton()
         button.titleLabel?.font = .systemFont(ofSize: 13)
         button.setTitle("프로필 편집", for: .normal)
         button.setTitleColor(UIColor.white, for: .normal)
         button.setImage(UIImage(systemName: "pencil"), for: .normal)
         button.tintColor = .white
         button.alignTextBelow(spacing: 10.0)
         
         return button
     }()
    
    let kakaoStoryButton = {
        let button = UIButton()
         button.titleLabel?.font = .systemFont(ofSize: 13)
         button.setTitle("카카오 스토리", for: .normal)
         button.setTitleColor(UIColor.white, for: .normal)
         button.setImage(UIImage(systemName: "quote.closing"), for: .normal)
         button.tintColor = .white
         button.alignTextBelow(spacing: 10.0)
         
         return button
     }()
    
    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        [topView, closeButton, settingButton, sendButton, giftButton, bottomView, profileImageView, nameLabel, lineView, messageButton, setProfileButton, kakaoStoryButton ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setAutoLayout()
        
    }
    // MARK: - 오토레이아웃 세팅

    func setAutoLayout() {

        topView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        bottomView.snp.makeConstraints { make in
            make.bottom.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(view).multipliedBy(0.3)
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
        
        profileImageView.snp.makeConstraints { make in
            make.centerX.equalTo(bottomView)
            make.top.equalTo(bottomView)
//            make.centerY.equalTo(bottomView).offset(-50)
            make.size.equalTo(bottomView.snp.width).multipliedBy(0.25)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(bottomView)
            make.top.equalTo(profileImageView.snp_bottomMargin).offset(20)
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.horizontalEdges.equalTo(bottomView)
            make.top.equalTo(nameLabel.snp_bottomMargin).offset(20)
        }
        
        messageButton.snp.makeConstraints { make in
            make.top.equalTo(lineView).offset(30)
            make.trailing.equalTo(setProfileButton).offset(-100)
            make.width.equalTo(bottomView.snp.width).multipliedBy(0.3)
            make.height.equalTo(bottomView.snp.height).multipliedBy(0.1)
        }
        
        setProfileButton.snp.makeConstraints { make in
            make.centerX.equalTo(bottomView)
            make.top.equalTo(messageButton)
            make.width.equalTo(bottomView.snp.width).multipliedBy(0.3)
            make.height.equalTo(bottomView.snp.height).multipliedBy(0.1)
        }
        
        kakaoStoryButton.snp.makeConstraints { make in
            make.leading.equalTo(setProfileButton).offset(100)
            make.top.equalTo(messageButton)
            make.width.equalTo(bottomView.snp.width).multipliedBy(0.3)
            make.height.equalTo(bottomView.snp.height).multipliedBy(0.1)
        }
        
    }
   

}
extension UIButton {
    func alignTextBelow(spacing: CGFloat = 4.0) {
               guard let image = self.imageView?.image else {
                   return
               }

               guard let titleLabel = self.titleLabel else {
                   return
               }

               guard let titleText = titleLabel.text else {
                   return
               }

               let titleSize = titleText.size(withAttributes: [
                   NSAttributedString.Key.font: titleLabel.font as Any
               ])

               titleEdgeInsets = UIEdgeInsets(top: spacing, left: -image.size.width, bottom: -image.size.height, right: 0)
               imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0, bottom: 0, right: -titleSize.width)
           }
   }
