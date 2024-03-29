//
//  ZJListManger.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/2.
//

import UIKit
import HandyJSON
class ZJListManger: NSObject {
    
    var lists: [ZJListModel] = []

    func getData(completion: @escaping ([ZJListModel])->Void) {
        
        Networking.shared.request(url: .zjList(free: "1", type: "1", pay: ZJPaymentType.sponsorPays.value, sex: "1", keyword: "", distance: "0", page: 1, limit: 10), modelType: ZJListModel.self) { data in
            print("sssss")
        }
        
        var items: [ZJListModel] = []
        
        for _ in 0...3 {
            let model = ZJListModel()
            model.organizer = "往事随风"
            model.age = 19
            model.gender = .man
            model.address = "台州市 温岭区"
            model.activityType = .sport
            model.time = "02/21 本周三 14:00"
            model.title = "城市探险跑 ---- 让我们一起跑遍城市的每一个角落！"
            model.zjState = "组局中"
            model.teamMember = []
            items.append(model)
        }
        
        lists = items
        completion(items)
    }
}
