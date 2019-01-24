//
//  ViewController.swift
//  Date Picker Demo
//
//  Created by Lahiru Chathuranga on 12/14/18.
//  Copyright © 2018 Elegant Media pvt ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var screen = UIScreen.main.bounds
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func didTapOnDateButton(_ sender: Any) {
        print("Success")
        UIView.animate(withDuration: 0.8, delay: 0.5, options: .transitionCurlUp, animations: {self.view.alpha = 1.0;}, completion: { (success) in
            let frame: CGRect = CGRect(x: 0, y: 0, width: self.screen.width, height: self.screen.height - 60)
            let nib = CustomDatePickerView(frame: frame)
            nib.delegate = self
            self.view.addSubview(nib)
        })
        
    }
   
    
}

extension ViewController: CustomDatePickerDelegate {
    func getDate() -> String {
        return ""
    }
    
    
}

