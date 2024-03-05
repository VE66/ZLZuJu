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
        getData()
        self.view.addSubview(listView)
        listView.manager = manager
        listView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func getData() {
        manager.getData { [weak self] items in
            self?.listView.reloadData()
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
