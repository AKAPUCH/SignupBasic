//
//  ViewController.swift
//  SignupBasic
//
//  Created by 최우태 on 2022/11/23.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var LoginId: UITextField! //초기상태에서는 뷰가 로딩되지 않았기 때문에 변경이 가능하도록 변수(var)로 선언
    
    @IBOutlet weak var LoginPw: UITextField!
    
    
    
    @IBAction func DoSignUp(_ sender : UIButton) {
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else {return}
        
        self.present(secondViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

