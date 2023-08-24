//
//  TextViewController.swift
//  SeSAC3Week6
//
//  Created by 황인호 on 2023/08/22.
//

import UIKit
import SnapKit

class TextViewController: UIViewController {

    
    //1. 사진관련 작업들을 할 수 있다.
    let picker = UIImagePickerController()
    
    
    
    
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
    
    //2. 읽는 권한은 설정이 필요없고 사용할 경우 권한이 필요하다.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        // available 사용할수 있는지
//
//
//        guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
//            print("갤러리 사용 불가, 사용자에게 토스트/ 얼럿")
//            return
//        }
//        // 설정했는지 확인
//        picker.delegate = self
//        //어떤 뷰를 띄워줄지
//        picker.sourceType = .camera
//        // 편집상태에 대한 허가
//        picker.allowsEditing = true
        let picker = UIFontPickerViewController()
        
        present(picker, animated: true)
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
 //3.
extension TextViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    // 사진을 선택하거나 카메라 촬영 직후
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // .original이미지로 하면 수정을 해도 원본으로 올라간다.
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.photoImageVIew.image = image
            dismiss(animated: true)
        }
    }
    
    // 취소 버튼 클릭 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(#function)
        dismiss(animated: true)
    }
}
