//
//  CustomDatePickerView.swift
//  Date Picker Demo
//
//  Created by Lahiru Chathuranga on 12/14/18.
//  Copyright © 2018 Elegant Media pvt ltd. All rights reserved.
//

import UIKit

protocol CustomDatePickerDelegate {
    func getDate() -> String
}

class CustomDatePickerView: UIView {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    var delegate: CustomDatePickerDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
        
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView =  nib.instantiate(withOwner: self, options: nil).first as! UIView
        return nibView
    }
    @IBAction func didTapOnDoneButton(_ sender: Any) {
        self.removeFromSuperview()
    }
    
    func setupNib() {
        mainView = loadViewFromNib()
        mainView.frame = bounds
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mainView.translatesAutoresizingMaskIntoConstraints = true
        
        addSubview(mainView)
    }

}
