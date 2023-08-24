//
//  GenericViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/24.
//

import UIKit
import SnapKit

class GenericViewController: UIViewController {

    let sampleLabel = UILabel()
    let sampleButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "네비게이션 타이틀"
        view.backgroundColor = .brown
        
        view.addSubview(sampleLabel)
        sampleLabel.backgroundColor = .yellow
        configureBorder(view: sampleLabel)
        sampleLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(sampleButton)
        sampleButton.backgroundColor = .green
        configureBorder(view: sampleButton)
        sampleButton.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(100)
            make.top.equalTo(sampleLabel.snp_bottomMargin).offset(20)
            make.height.equalTo(50)
        }
        
        let generic = sum(a: 3.3, b: 1.4)
        
        
        let value = sumInt(a: 3, b: 7)
        print(value)
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
