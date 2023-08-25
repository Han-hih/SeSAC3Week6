//
//  CustomTableViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/24.
//

import UIKit
import SnapKit

struct Sample {
    let text: String
    var isExpand: Bool
}

class CustomTableViewController: UIViewController {
    
    //화면이 뜨기전에 뷰계층을 로드하고 viewdidload가 실행된다.
    //customTableViewController 인스턴스 생성 직전에 클로저 구문이 우선 실행
    lazy var tableView = {
        let view = UITableView()
        view.rowHeight = UITableView.automaticDimension // 1. 테이블 뷰의 높이를 유동적으로 사용
        view.delegate = self //자기 자신의 인스턴스
        view.dataSource = self
        //customcell 을 넣어줄 수도 있다.
        view.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        return view
    }()
    
    // 제약조건을 이미 주어서 이 값만큼 올라가고 깎이는 기능이 올라간다.
    let imageView = {
        let view = PosterImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
    }()
    
    
    
    //false -> 2줄 true -> 0줄
//    var isExpand = false
    
    var list = [
                Sample(text: "테스트 셀 텍스트+++++++++++++++++++++++++++++++++++++++++++++=======================================================", isExpand: false),
                Sample(text: "dsdfdggsdfsdfsdfsd+========================f", isExpand: false),
                Sample(text: "sdgdfld===============================================================================fgldfknklnklahvcvkkn", isExpand: false)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            print("constraints")
            make.size.equalTo(200)
            make.center.equalTo(view)
        }
        
    }
    
}



extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
        cell.textLabel?.text = list[indexPath.row].text
        cell.textLabel?.numberOfLines = list[indexPath.row].isExpand ? 0 : 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        isExpand.toggle()
        list[indexPath.row].isExpand.toggle()
        tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
