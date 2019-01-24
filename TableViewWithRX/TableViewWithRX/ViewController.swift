//
//  ViewController.swift
//  TableViewWithRX
//
//  Created by Lahiru Chathuranga on 1/24/19.
//  Copyright © 2019 Elegant Media pvt ltd. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var namesTableView: UITableView!
    
    private let vm = ViewControllerVM()
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        
    }
    
    func bindData() {
        vm.nameList.asObservable()
            .bind(to: namesTableView.rx.items(cellIdentifier: "cell", cellType: NamesCVCell.self)) { (row, element, cell) in
                cell.configureCell(element: element)
                
                cell.nameSwitch.rx
                    .controlEvent(.valueChanged)
                    .withLatestFrom(cell.nameSwitch.rx.value)
                    .subscribe(onNext: { bool in
                        self.makeAlert(name: element, isActive: bool)
                    }).disposed(by: self.bag)
            }
            .disposed(by: bag)
    }
    
    func makeAlert(name: String, isActive: Bool) {
        if isActive {
            let alertController = UIAlertController.init(title: "Alert", message: "\(name) is selected", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alertController, animated: true)
        }
    }
    
}
