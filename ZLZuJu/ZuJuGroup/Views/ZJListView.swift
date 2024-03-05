//
//  ZJListView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/2.
//

import UIKit
import SnapKit
class ZJListView: UIView {
    
    weak var manager: ZJListManger? {
        didSet {
            self.tbView.reloadData()
        }
    }
    
    private lazy var tbView = {
        let tb = UITableView(frame: CGRect.zero, style: .plain)
        tb.dataSource = self
        tb.delegate = self
        tb.estimatedRowHeight = 196
        tb.rowHeight = UITableView.automaticDimension
        tb.separatorStyle = .none
        tb.backgroundColor = UIColor(hex: "#F6F6F6")
        tb.register(ZJTableViewCell.self, forCellReuseIdentifier: NSStringFromClass(ZJTableViewCell.self))
        return tb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(tbView)
        tbView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func reloadData() {
        self.tbView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension ZJListView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return manager?.lists.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ZJTableViewCell.self), for: indexPath) as! ZJTableViewCell
        let model = manager!.lists[indexPath.row]
        cell.setData(model)
        return cell
    }
    
    
}
