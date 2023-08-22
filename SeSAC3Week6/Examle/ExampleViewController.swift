//
//  ExampleViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/22.
//

import UIKit

class ExampleViewController: UIViewController {

    let mainView = {
        let view = UIView()
        
       return view
    }()
    
    let goToExample1 = {
        let button = UIButton()
        button.setTitle("Example1", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(gotoExample1), for: .touchUpInside)
        
        return button
    }()
    
    let goToExample2 = {
        let button = UIButton()
        button.setTitle("Example2", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(gotoExample2), for: .touchUpInside)
        
        return button
    }()
    
    let goToExample3 = {
        let button = UIButton()
        button.setTitle("Example3", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(gotoExample3), for: .touchUpInside)
       
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainView)
        view.addSubview(goToExample1)
        view.addSubview(goToExample2)
        view.addSubview(goToExample3)
        
        setAutoLayout()
    }
    
    
    @objc func gotoExample1() {
        let vc = Example1ViewController()
        present(vc, animated: true)
    }
    
    @objc func gotoExample2() {
        let vc = Example2ViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    @objc func gotoExample3() {
        let vc = Example3ViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func setAutoLayout() {
        
        mainView.snp.makeConstraints { make in
            make.horizontalEdges.verticalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        
        goToExample1.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(mainView)
            make.height.equalTo(mainView).multipliedBy(0.3)
        }
        goToExample2.snp.makeConstraints { make in
            make.top.equalTo(goToExample1.snp_bottomMargin)
            make.horizontalEdges.equalTo(mainView)
            make.height.equalTo(mainView).multipliedBy(0.3)
        }
        goToExample3.snp.makeConstraints { make in
            make.top.equalTo(goToExample2.snp_bottomMargin)
            make.horizontalEdges.equalTo(mainView)
            make.height.equalTo(mainView).multipliedBy(0.3)
        }
    }
   

}
