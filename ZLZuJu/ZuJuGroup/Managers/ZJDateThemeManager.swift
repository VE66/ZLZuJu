//
//  ZJDateThemeManager.swift
//  SheJiaoQuan
//
//  Created by ZCZ on 2024/3/17.
//

import UIKit

protocol DateThemeProtocol: AnyObject {
    func reloadThemeData(_ lists: [ZJDateTheme])
}

class ZJDateThemeManager: NSObject {
    
    static let shared = ZJDateThemeManager()
    weak var deleagete: DateThemeProtocol?
    
    var lists: [ZJDateTheme] = [] {
        didSet {
            deleagete?.reloadThemeData(lists)
        }
    }
    
    func getDateThemeData() {
        Networking.shared.request(url: .party_type, modelType: ZJDateTheme.self) { data in
            guard let data = data else {
                return
            }
            if data.code == 1, let list = data.data {
                self.lists = list
            } else {
                self.lists.removeAll()
            }
        }
    }

}
