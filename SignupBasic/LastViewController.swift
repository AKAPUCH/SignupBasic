//
//  LastViewController.swift
//  SignupBasic
//
//  Created by 최우태 on 2022/11/29.
//

import UIKit

class LastViewController: UIViewController {

    
    let phoneNum : UILabel = {
       let labelSettings = UILabel()
        labelSettings.text = "전화번호"
        labelSettings.font = .systemFont(ofSize: 15)
        labelSettings.translatesAutoresizingMaskIntoConstraints = false
        return labelSettings
    }()
    
    let birth : UILabel = {
       let labelSettings = UILabel()
        labelSettings.text = "생년월일"
        labelSettings.font = .systemFont(ofSize: 15)
        labelSettings.translatesAutoresizingMaskIntoConstraints = false
        return labelSettings
    }()
    
    let trackingBirth : UILabel = {
       let labelSettings = UILabel()
        labelSettings.font = .systemFont(ofSize: 15)
        labelSettings.text = "테스트"
        labelSettings.textAlignment = .center
        labelSettings.translatesAutoresizingMaskIntoConstraints = false
        return labelSettings
    }()
    
    let pnText : UITextField = {
        let fieldSettings = UITextField()
        fieldSettings.borderStyle = .roundedRect
        fieldSettings.translatesAutoresizingMaskIntoConstraints = false
        return fieldSettings
    }()
    
    let picker : UIDatePicker = {
        let pickerSettings = UIDatePicker()
        pickerSettings.translatesAutoresizingMaskIntoConstraints = false

        return pickerSettings
    }()

    let cancelButton : UIButton = {
       let btnSettings = UIButton()
        btnSettings.setTitle("취소", for: .normal)
        btnSettings.setTitleColor(.systemRed, for: .normal)
        btnSettings.translatesAutoresizingMaskIntoConstraints = false
        return btnSettings
    }()

    let previousButton : UIButton = {
       let btnSettings = UIButton()
        btnSettings.setTitle("이전", for: .normal)
        btnSettings.setTitleColor(.systemBlue, for: .normal)
        btnSettings.translatesAutoresizingMaskIntoConstraints = false
        return btnSettings
    }()
    
    let joinButton : UIButton = {
       let btnSettings = UIButton()
        btnSettings.setTitle("가입", for: .normal)
        btnSettings.setTitleColor(.systemGray, for: .disabled)
        btnSettings.setTitleColor(.systemBlue, for: .normal)
        btnSettings.isEnabled = false
        btnSettings.translatesAutoresizingMaskIntoConstraints = false
        return btnSettings
    }()
    
    let stack : UIStackView = {
       let stackSettings = UIStackView()
        stackSettings.distribution = .fillEqually
        stackSettings.axis = .horizontal
        stackSettings.translatesAutoresizingMaskIntoConstraints = false
        return stackSettings
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        super.viewDidLoad()
        addObject()
        addLayout()
    }
    
    func addObject() {
        stack.addArrangedSubviews([cancelButton,previousButton,joinButton])
        view.addSubviews([phoneNum,pnText,birth,trackingBirth,picker,stack])
    }
    
    func addLayout() {
        NSLayoutConstraint.activate([
            phoneNum.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 10),
            phoneNum.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            phoneNum.widthAnchor.constraint(equalToConstant: 100),
            phoneNum.heightAnchor.constraint(equalToConstant: 15),
            pnText.topAnchor.constraint(equalTo: phoneNum.bottomAnchor,constant: 5),
            pnText.leadingAnchor.constraint(equalTo: phoneNum.leadingAnchor),
            pnText.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            pnText.heightAnchor.constraint(equalToConstant: 30),
            birth.topAnchor.constraint(equalTo: pnText.bottomAnchor, constant: 5),
            birth.leadingAnchor.constraint(equalTo: phoneNum.leadingAnchor),
            birth.widthAnchor.constraint(equalToConstant: 100),
            birth.heightAnchor.constraint(equalToConstant: 15),
            trackingBirth.topAnchor.constraint(equalTo: birth.topAnchor),
            trackingBirth.trailingAnchor.constraint(equalTo: pnText.trailingAnchor),
            trackingBirth.leadingAnchor.constraint(equalTo: birth.trailingAnchor, constant: 150),
            trackingBirth.heightAnchor.constraint(equalToConstant: 15),
            picker.topAnchor.constraint(equalTo: birth.bottomAnchor,constant: 10),
            picker.leadingAnchor.constraint(equalTo: pnText.leadingAnchor),
            picker.trailingAnchor.constraint(equalTo: pnText.trailingAnchor),
            picker.heightAnchor.constraint(equalToConstant: 200),
            stack.topAnchor.constraint(equalTo: picker.bottomAnchor, constant: 20),
            stack.leadingAnchor.constraint(equalTo: picker.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: picker.trailingAnchor),
            stack.heightAnchor.constraint(equalToConstant: 15)
        ])
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

extension UIView {
    func addSubviews(_ views : [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
}

extension UIStackView {
    func addArrangedSubviews(_ views : [UIView]){
        for view in views {
            self.addArrangedSubview(view)
        }
    }
}
