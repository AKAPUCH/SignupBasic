//
//  SecondViewController.swift
//  SignupBasic
//
//  Created by 최우태 on 2022/11/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    let stacks : UIStackView = {
        let stackSettings = UIStackView()
        stackSettings.translatesAutoresizingMaskIntoConstraints = false
        stackSettings.axis = .vertical
        stackSettings.alignment = .fill
        stackSettings.distribution = .equalSpacing
        stackSettings.spacing = 5
        
        return stackSettings
    }()
    
    let profile : UIImageView = {
        let imageSettings = UIImageView()
        imageSettings.image = UIImage(named: "rabbits")
        imageSettings.contentMode = .scaleToFill
        return imageSettings
    }()
    
    let profileId : UITextField = {
        let textSettings = UITextField()
        textSettings.translatesAutoresizingMaskIntoConstraints = false
        //textSettings.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textSettings.borderStyle = .roundedRect
        textSettings.textAlignment = .left
        return textSettings
    }()
    let profilePw : UITextField = {
        let textSettings = UITextField()
        textSettings.borderStyle = .roundedRect
        textSettings.translatesAutoresizingMaskIntoConstraints = false
        textSettings.textAlignment = .left
        textSettings.isSecureTextEntry = true
        return textSettings
    }()
    
    let ValidatedPw : UITextField = {
        let textSettings = UITextField()
        textSettings.borderStyle = .roundedRect
        textSettings.translatesAutoresizingMaskIntoConstraints = false
        textSettings.textAlignment = .left
        textSettings.isSecureTextEntry = true
        return textSettings
    }()
    
    let intro : UITextView = {
        let settings = UITextView()
        settings.textAlignment = .left
        settings.backgroundColor = .systemYellow
        settings.font = .systemFont(ofSize: 20)
        return settings
    }()
    
    let cancelButton : UIButton = {
        let buttonSettings = UIButton()
        buttonSettings.setTitle("취소", for: .normal)
        buttonSettings.setTitleColor(.systemRed, for: .normal)
        buttonSettings.contentHorizontalAlignment = .center
        buttonSettings.addTarget(self, action: #selector(pressCancelButton), for: .touchUpInside)
        buttonSettings.translatesAutoresizingMaskIntoConstraints = false
        return buttonSettings
    }()
    
    let nextButton : UIButton = {
        let buttonSettings = UIButton()
        buttonSettings.setTitle("다음", for: .normal)
        buttonSettings.setTitleColor(.systemBlue, for: .normal)
        buttonSettings.contentHorizontalAlignment = .center
        buttonSettings.translatesAutoresizingMaskIntoConstraints = false
        return buttonSettings
    }()
    
    @IBAction func pressCancelButton(_ sender : UIButton) {
        self.dismiss(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addObject()
    }
    
    func addObject() {
        addImage()
        addStack()
        addTextView()
        addCancelButton()
        addNextButton()
        
    }
    
    func addStack() {
        view.addSubview(stacks)
        stacks.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        stacks.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -15).isActive = true
        stacks.leadingAnchor.constraint(equalTo: profile.trailingAnchor,constant: 15).isActive = true
        stacks.bottomAnchor.constraint(equalTo: profile.bottomAnchor).isActive = true
        stacks.addArrangedSubview(profileId)
        stacks.addArrangedSubview(profilePw)
        stacks.addArrangedSubview(ValidatedPw)
        
    }
    
    func addImage() {
        view.addSubview(profile)
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
        profile.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15).isActive = true
        profile.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profile.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func addTextView() {
        view.addSubview(intro)
        intro.translatesAutoresizingMaskIntoConstraints = false
        intro.topAnchor.constraint(equalTo: profile.bottomAnchor, constant: 10).isActive = true
        intro.leadingAnchor.constraint(equalTo: profile.leadingAnchor).isActive = true
        intro.trailingAnchor.constraint(equalTo: stacks.trailingAnchor).isActive = true
        intro.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -100).isActive = true
    }
    
    func addCancelButton() {
        view.addSubview(cancelButton)
        cancelButton.topAnchor.constraint(equalTo: intro.bottomAnchor).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: intro.leadingAnchor).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        cancelButton.trailingAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func addNextButton() {
        view.addSubview(nextButton)
        nextButton.topAnchor.constraint(equalTo: cancelButton.topAnchor).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: cancelButton.trailingAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: cancelButton.bottomAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: intro.trailingAnchor).isActive = true
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
