//
//  ViewController.swift
//  SignupBasic
//
//  Created by 최우태 on 2022/11/23.
//

import UIKit




class FirstViewController: UIViewController {
    
    let idText : UITextField = {
        let idSettings = UITextField()
        idSettings.placeholder = "ID"
        idSettings.textAlignment = .left
        idSettings.borderStyle = .roundedRect
        return idSettings
    }()
    
    let pwText : UITextField = {
        let pwSettings = UITextField()
        pwSettings.placeholder = "Password"
        pwSettings.textAlignment = .left
        pwSettings.borderStyle = .roundedRect
        return pwSettings
    }()
    
    
    let mainImage : UIImageView = {
        let imageSettings = UIImageView()
        imageSettings.image = UIImage(named: "beemo")
        return imageSettings
    }()
    
    let signUpButton : UIButton = {
        let lButtonSettings = UIButton()
        lButtonSettings.setTitle("Sign Up", for: .normal)
        lButtonSettings.setTitleColor(.systemRed, for: .normal)
        lButtonSettings.setTitleColor(.systemIndigo, for: .selected)
        lButtonSettings.addTarget(nil, action: #selector(pressButton(_ :)), for: .touchUpInside)
        return lButtonSettings
    }()
    
    let signInButton : UIButton = {
        let sButtonSettings = UIButton()
        sButtonSettings.setTitle("Sign In", for: .normal)
        sButtonSettings.setTitleColor(.systemBlue, for: .normal)
        return sButtonSettings
    }()
    
    @IBAction func pressButton(_ sender : UIButton) {
        let secondView = SecondViewController()
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        addObject()
    }
    
    func addObject() {
        addImage()
        addText()
        addButton()
    }
    
    func addImage() {
        view.addSubview(mainImage)
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
        
    }
    
    func addText() {
        view.addSubview(idText)
        view.addSubview(pwText)
        idText.translatesAutoresizingMaskIntoConstraints = false
        idText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        idText.widthAnchor.constraint(equalToConstant: 200).isActive = true
        idText.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 30 ).isActive = true
        
        pwText.translatesAutoresizingMaskIntoConstraints = false
        pwText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pwText.topAnchor.constraint(equalTo: idText.bottomAnchor, constant: 10).isActive = true
        pwText.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    func addButton() {
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.topAnchor.constraint(equalTo: pwText.bottomAnchor, constant: 20).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: pwText.leadingAnchor, constant: 20).isActive = true
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.topAnchor.constraint(equalTo: pwText.bottomAnchor, constant: 20).isActive = true
        signUpButton.leadingAnchor.constraint(equalTo: signInButton.trailingAnchor, constant: 30).isActive = true
        signUpButton.trailingAnchor.constraint(equalTo: pwText.trailingAnchor, constant: 20).isActive = true
    }
    
    func navigationItemSetting(){
        
    }
    
    
    
    
}

