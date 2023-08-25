//
//  CustomTableViewCell.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/25.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    let label = UILabel()
    let button = UIButton()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        configure()
        setConstraints() //addSubView이후에 constraints설정
        
    }
    
    //프로토콜로 이루어져 있다.
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // view.addsubview 라고 하면 테이블뷰라서 오류가 난다
    func configure() {
        contentView.addSubview(label) //주의하기
        contentView.addSubview(button)
        
        label.backgroundColor = .yellow
        button.backgroundColor = .green
    }
    
    func setConstraints() {
        button.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.centerY.trailingMargin.equalTo(contentView)
        }
        label.snp.makeConstraints { make in
            make.top.leadingMargin.bottom.equalTo(contentView)
            make.trailing.equalTo(button.snp.leading).inset(8)
        }
        
    }
    
    //Interface Builder에서만 동작한다.
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
