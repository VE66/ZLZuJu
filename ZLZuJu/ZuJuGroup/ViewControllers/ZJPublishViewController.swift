//
//  ZJPublishViewController.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/10.
//

import UIKit

class ZJPublishViewController: UIViewController {

    lazy var publishView: ZJPublishView = {
        let view = ZJPublishView(frame: self.view.bounds)
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#F6F6F6")
        self.view.addSubview(publishView)
        publishView.snp.makeConstraints { make in
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
