//
//  ZJListViewController.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/2.
//

import UIKit
import SnapKit
class ZJListViewController: UIViewController {
    
    private var manager = ZJListManger()
    
    lazy var listView = {
        let view = ZJListView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(listView)
        listView.snp.makeConstraints { make in
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
