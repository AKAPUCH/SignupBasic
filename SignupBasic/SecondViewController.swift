//
//  SecondViewController.swift
//  SignupBasic
//
//  Created by 최우태 on 2022/11/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    var userInfomation : UserInfomation = UserInfomation.shared
    
    let picker = UIImagePickerController()
    
    let stacks : UIStackView = {
        let stackSettings = UIStackView()
        stackSettings.translatesAutoresizingMaskIntoConstraints = false
        stackSettings.axis = .vertical
        stackSettings.alignment = .fill
        stackSettings.distribution = .equalSpacing
        stackSettings.spacing = 5
        
        return stackSettings
    }()
    
    lazy var profile : UIImageView = {
        let imageSettings = UIImageView()
        imageSettings.image = UIImage(named: "rabbits")
        imageSettings.contentMode = .scaleToFill
        let tap = UITapGestureRecognizer(target: self, action: #selector(addAction(_ :)))
        imageSettings.addGestureRecognizer(tap)
        imageSettings.isUserInteractionEnabled = true
        return imageSettings
    }()
    
    let profileId : UITextField = {
        let textSettings = UITextField()
        textSettings.translatesAutoresizingMaskIntoConstraints = false
        //textSettings.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textSettings.borderStyle = .roundedRect
        textSettings.textAlignment = .left
        textSettings.addTarget(self, action: #selector(DetectChange(_ :)), for: .editingChanged)
        return textSettings
    }()
    let profilePw : UITextField = {
        let textSettings = UITextField()
        textSettings.borderStyle = .roundedRect
        textSettings.translatesAutoresizingMaskIntoConstraints = false
        textSettings.textAlignment = .left
        textSettings.isSecureTextEntry = true
        textSettings.addTarget(self, action: #selector(DetectChange(_ :)), for: .editingChanged)
        return textSettings
    }()
    
    let ValidatedPw : UITextField = {
        let textSettings = UITextField()
        textSettings.borderStyle = .roundedRect
        textSettings.translatesAutoresizingMaskIntoConstraints = false
        textSettings.textAlignment = .left
        textSettings.isSecureTextEntry = true
        textSettings.addTarget(self, action: #selector(DetectChange(_ :)), for: .editingChanged)
        return textSettings
    }()
    
    lazy var intro : UITextView = {
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
        buttonSettings.setTitleColor(.lightGray, for: .normal)
        buttonSettings.contentHorizontalAlignment = .center
        buttonSettings.isUserInteractionEnabled = false
        buttonSettings.addTarget(self, action: #selector(pressNextButton), for: .touchUpInside)
        buttonSettings.translatesAutoresizingMaskIntoConstraints = false
        return buttonSettings
    }()

    
    @objc func addAction(_ gesture : UITapGestureRecognizer) {
        openLibrary()
    }
    
    
    @IBAction func pressCancelButton(_ sender : UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func pressNextButton(_ sender : UIButton) {
        saveProfile()
        let view = LastViewController()
        view.modalPresentationStyle = .fullScreen
        self.present(view, animated: true)
    }
    
    func saveProfile() {
        guard let savedId = profileId.text else{return}
        guard let savedPw = profilePw.text else{return}
        guard let savedImage = profile.image else{return}
        guard let savedIntro = intro.text else{return}
        userInfomation.registUserId(id: savedId)
        userInfomation.registUserPwd(password: savedPw)
        userInfomation.registUserProfile(profile: savedImage)
        userInfomation.registUserIntroduce(introduce: savedIntro)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        picker.delegate = self
        intro.delegate = self
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
    
    func CheckPw(_ pw1 : UITextField, _ pw2 : UITextField) -> Bool {
        if pw1.text == pw2.text {
            return true
        }
        return false
    }
    
    @objc func DetectChange(_ sender : UITextField) {
        clearProfile()
    }
    
    func clearProfile() {
        if !(self.profilePw.text?.isEmpty ?? true)
            && !(self.profileId.text?.isEmpty ?? true)
        && !(self.ValidatedPw.text?.isEmpty ?? true)
        && CheckPw(profilePw, ValidatedPw)
            && !(self.intro.text?.isEmpty ?? true)
            && (self.profile.image != UIImage(named: "rabbits") ){
            nextButton.setTitleColor(.systemBlue, for: .normal)
            nextButton.isUserInteractionEnabled = true
        }
        else {
            DisactivateButton()
            
        }
    }
    
    
    func DisactivateButton() {
        nextButton.setTitleColor(.lightGray, for: .normal)
        nextButton.isUserInteractionEnabled = false
    }
    
    func openLibrary() {
        picker.sourceType = .photoLibrary
        picker.modalPresentationStyle = .fullScreen
        present(picker, animated: true, completion: nil)
    }
    
    
}

extension SecondViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate,UITextViewDelegate
, UITextFieldDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profile.image = image
            //print(info)
        }
        clearProfile()
        dismiss(animated: true, completion: nil)
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
       clearProfile()
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        clearProfile()
    }
    
    func textViewDidChange(_ textView: UITextView) {
        clearProfile()
    }
    
    
    
    
}

