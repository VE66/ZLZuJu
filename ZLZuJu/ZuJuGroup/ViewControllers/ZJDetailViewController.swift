//
//  ZJDetailViewController.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/11.
//

import UIKit

class ZJDetailViewController: UIViewController {
    lazy var detailView = {
        let view = ZJDetailView(frame: self.view.bounds)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = color_F6F6F6
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(detailView)
        detailView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        detailView.updateBottomView(self.view.safeAreaInsets.bottom)
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
