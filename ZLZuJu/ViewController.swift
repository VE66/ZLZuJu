//
//  ViewController.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/2.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }

    func setUI() {
        let button = UIButton(type: .system)
        button.setTitle("跳转", for: .normal)
        
        self.view.addSubview(button)
        button.snp.makeConstraints { make in
            make.left.equalTo(40)
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
        
        button.addTarget(self, action: #selector(pushZLTableViewController), for: .touchUpInside)
    }
    
    @objc func pushZLTableViewController() {
        let vc = ZJListViewController()
//        let vc = ZJPublishViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

