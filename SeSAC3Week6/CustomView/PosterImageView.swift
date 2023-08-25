//
//  PosterImageView.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/25.
//

import UIKit
class PosterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureView() {
        print(frame.width, frame)
        backgroundColor = .yellow
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
    //   layer.cornerRadius = frame.width / 2    //가장 나중에 사용되도록 해준다.
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        print("layoutSubView", frame.width, frame)
        layer.cornerRadius = frame.width / 2
    }
}
