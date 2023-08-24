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

    
    let tableView = {
       let view = UITableView()
        view.rowHeight = UITableView.automaticDimension // 1. 테이블 뷰의 높이를 유동적으로 사용
        
        return view
    }()
    
    //false -> 2줄 true -> 0줄
    var isExpand = false
    
    var list = [Sample(text: "테스트 셀 텍스트+++++++++++++++++++++++++++++++++++++++++++++=======================================================", isExpand: false), Sample(text: "dsdfdggsdfsdfsdfsd+========================f", isExpand: false), Sample(text: "sdgdfld===============================================================================fgldfknklnklahvcvkkn", isExpand: false)]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //customcell 을 넣어줄 수도 있다.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    
}



extension CustomTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
        cell.textLabel?.text = list[indexPath.row].text
        cell.textLabel?.numberOfLines = list[indexPath.row].isExpand ? 0 : 2
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        isExpand.toggle()
        list[indexPath.row].isExpand.toggle()
//        tableView.reloadData()
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

}
