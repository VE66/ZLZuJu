//
//  ZJGroupInfoView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/12.
//

import UIKit

enum ZJGroupInfoListMode {
    case members, /// 群列表
         signIn, /// 签到
         groupName, /// 群名称
         announcement, /// 群公告
         noDisturbing, /// 免打扰
         chatTop, /// 消息置顶
         demand, /// 投诉
         loggout /// 退出组局
    
    var name: String {
        switch self {
        case .members:
            return "群列表"
        case .signIn:
            return "成员签到"
        case .groupName:
            return "群聊名称"
        case .announcement:
            return "群公告"
        case .noDisturbing:
            return "消息免打扰"
        case .chatTop:
            return "群聊置顶"
        case .demand:
            return "投诉"
        case .loggout:
            return "退出组局"
        }
    }
    
    var cell_id: String {
        switch self {
        case .members:
            return NSStringFromClass(ZJGroupMemberCell.self)
        case .signIn, .groupName, .announcement, .demand:
            return NSStringFromClass(ZJGroupInfoCell.self)
        case .noDisturbing, .chatTop:
            return NSStringFromClass(ZJGroupInfoSwitchCell.self)
        case .loggout:
            return NSStringFromClass(ZJGroupLogoutCell.self)
        }
    }
    
}

class ZJGroupInfoView: UIView {
    
    let lists: [[ZJGroupInfoListMode]] = [
     [.members],
     [.signIn, .groupName, .announcement, .noDisturbing, .chatTop, .demand],
     [.loggout]
    ]
    
    var groupInfo: String = ""
    
    lazy var tableview = {
        let tab = UITableView(frame: CGRect.zero, style: .plain)
        tab.delegate = self
        tab.dataSource = self
        tab.backgroundColor = color_F6F6F6
        tab.register(ZJGroupInfoCell.self, forCellReuseIdentifier: NSStringFromClass(ZJGroupInfoCell.self))
        tab.register(ZJGroupInfoSwitchCell.self, forCellReuseIdentifier: NSStringFromClass(ZJGroupInfoSwitchCell.self))
        tab.register(ZJGroupMemberCell.self, forCellReuseIdentifier: NSStringFromClass(ZJGroupMemberCell.self))
        tab.register(ZJGroupLogoutCell.self, forCellReuseIdentifier: NSStringFromClass(ZJGroupLogoutCell.self))
        tab.separatorStyle = .none
        
        return tab
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ZJGroupInfoView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items = lists[indexPath.section]
        let mode = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: mode.cell_id, for: indexPath)
        return cell
    }
    
    
}
