//
//  ViewController.swift
//  MoyaDemo
//
//  Created by Lahiru Chathuranga on 12/21/18.
//  Copyright © 2018 Elegant Media pvt ltd. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    var email: String = ""
    var password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    @IBAction func pressedLogin(_ sender: Any) {
        print("PRESSED")
        view.endEditing(true)
        let param = ["email": email, "password": password]
        webService(param: param)
        
    }
    
    func webService(param: [String: String]) {
        print("FUNCTION CALLED")
        let provider = MoyaProvider<MyServerAPI>()
        provider.request(.login(param: param)) { result in
            print("PARAM:\(param)")
            
            switch result {
            case .success(let response):
                print(response.statusCode)
                let json = JSON(response.data)
                print("JSON: \(json)")
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
    }

}
extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == emailTF {
            self.email = emailTF.text ?? ""
        }
        if textField == passwordTF {
            self.password = passwordTF.text ?? ""
        }
    }
}

