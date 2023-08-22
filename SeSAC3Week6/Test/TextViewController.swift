//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {

    // 이름이 없는 함수를 반환해서 클로저로 적용시켜준다.
    let photoImageVIew = {
        let view = UIImageView()
        view.backgroundColor = .systemCyan
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let titleTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "제목을 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        
        return view
    }()
    // ()가 없으면 연산프로퍼티 이다.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for item in [photoImageVIew, titleTextField] {
            view.addSubview(item)
        }
        [photoImageVIew, titleTextField].forEach {
            view.addSubview($0)

        }
    setLayout()
    }
    
    
    func setLayout() {
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageVIew.snp.bottom).offset(20)
            make.leadingMargin.equalTo(20)
            // make.leading.equalTo(view).inset(20) 이랑 같다.
            make.trailingMargin.equalTo(-20)
            make.height.equalTo(50)
        }
        
        photoImageVIew.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            //높이가 뷰와 똑같은데 비율이 30프로 이다.
            make.height.equalTo(view).multipliedBy(0.3)
        }
    }
    
    
    
    
}
