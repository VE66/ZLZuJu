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
    
    lazy var zjlocalView = {
        let view = ZJLocalView()
        return view
    }()
    
    lazy var listView = {
        let view = ZJListView()
        view.clipsToBounds = true
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
//        setRightBarItem()
        self.view.addSubview(listView)
        self.view.addSubview(zjlocalView)
        listView.manager = manager
        zjlocalView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(56)
        }
        listView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(zjlocalView.snp.bottom)
        }
    }
    
    @objc func filterAction() {
        let vc = ZJFilterViewController()
        self.present(vc, animated: true)
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
