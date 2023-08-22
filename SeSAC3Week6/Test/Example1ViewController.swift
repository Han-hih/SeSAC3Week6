//
//  Example1ViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/22.
//

import UIKit

class Example1ViewController: UIViewController {

    let grayView = {
        let view = UIView()
        view.backgroundColor = .gray

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
    
    let dateTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.placeholder = "날짜를 입력해주세요"
        view.textAlignment = .center
        view.font = .boldSystemFont(ofSize: 15)
        
        return view
    }()
    
    let emptyTextField = {
        let view = UITextField()
        view.borderStyle = .none
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(grayView)
        view.addSubview(titleTextField)
        view.addSubview(dateTextField)
        view.addSubview(emptyTextField)
        
        view.backgroundColor = .white
        
        grayView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(200)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(grayView.snp_bottomMargin).offset(30)
            make.horizontalEdges.equalTo(grayView)
            make.height.equalTo(50)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp_bottomMargin).offset(30)
            make.horizontalEdges.equalTo(grayView)
            make.height.equalTo(50)
        }
        
        emptyTextField.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp_bottomMargin).offset(30)
            make.horizontalEdges.equalTo(grayView)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        
    }
    



}
