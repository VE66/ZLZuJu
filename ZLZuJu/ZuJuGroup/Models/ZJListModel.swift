//
//  ZJListModel.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/2.
//

import UIKit
import HandyJSON

enum ZJPaymentType {
    case sponsorPays, // 发起者买单
         manA, // 男A女免
         AA //
}

enum ZJGenderType {
    case girl, man
}

enum ZJActivityType {
    case eat, // 吃饭
         movie, // 看电影
         sing, // 唱歌
         sport, // 运动
         chat,  // 聊天
         shopping, // 逛街
         travel, // 旅游
         custom // 自定义
    
    var value: String {
        switch self {
        case .eat:
            return "吃饭"
        case .movie:
            return "看电影"
        case .sing:
            return "唱歌"
        case .sport:
            return "运动"
        case .chat:
            return "聊天"
        case .shopping:
            return "逛街"
        case .travel:
            return "旅游"
        case .custom:
            return "自定义"
        }
    }
    
}


class ZJListModel: HandyJSON {
    var organizer: String?
    var avater: String?
    var gender: ZJGenderType = .man
    var age: Int = 0
    var isVip: Bool = false
    var paymentState: ZJPaymentType = .sponsorPays
    var title: String?
    var activityType: ZJActivityType = .custom
    var time: String?
    var address: String?
    var teamMember: [ZJListModel]?
    var zjState: String? // 组局状态
    
    
    required init() {
        
    }

}
