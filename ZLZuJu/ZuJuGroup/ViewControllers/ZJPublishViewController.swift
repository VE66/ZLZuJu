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
        title = "发布约会"
        ZJDateThemeManager.shared.getDateThemeData()

        self.view.backgroundColor = UIColor(hex: "#F6F6F6")
        self.view.addSubview(publishView)
        let backView = UIButton(type: .custom)
        backView.setImage(UIImage(named: "zj_arrow_left"), for: .normal)
        backView.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backView)
        publishView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

    }
    
    override func viewSafeAreaInsetsDidChange() {
        super.viewSafeAreaInsetsDidChange()
        publishView.updateBottomView(self.view.safeAreaInsets)
    }
    
    @objc func backAction() {
        if self.navigationController?.viewControllers.count ?? 0 > 1 {
            self.navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
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
