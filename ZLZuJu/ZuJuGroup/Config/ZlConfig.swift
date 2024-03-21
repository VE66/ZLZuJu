//
//  ZlConfig.swift
//  SheJiaoQuan
//
//  Created by ZCZ on 2024/3/17.
//

import UIKit

enum RequestMode: String {
    case GET, POST    
}

enum ZlUrl {
    case zjList(free: String, type: String, pay: String, sex: String, keyword: String, distance: String, page: Int, limit: Int = 10),
         party_type
    
    
    var url: String {
        var urlString = ""
    
        switch self {
        case .zjList(let free, let type, let pay, let sex, let keyword, let distance, let page, let limit):
            urlString = "party/list?free=\(free)&type=\(type)&pay=\(pay)&sex=\(sex)&keyword=\(keyword)&distance=\(distance)&page=\(page)&limit=\(limit)"
        case .party_type:
            urlString = "party/type"
        }
        
       return urlString
    }
}
