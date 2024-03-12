//
//  ZJGroupChatViewController.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/12.
//

import UIKit

class ZJGroupChatViewController: UIViewController {

    lazy var groupInfoView = {
       let view =  ZJGroupInfoView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.view.addSubview(groupInfoView)
        groupInfoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
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
