//
//  Example1ViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/22.
//

import UIKit

class Example1ViewController: UIViewController {

    let grayView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        grayView.backgroundColor = .gray
        view.addSubview(grayView)
        grayView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(200)
        }
        
        
        
    }
    



}
