//
//  Networking.swift
//  SheJiaoQuan
//
//  Created by ZCZ on 2024/3/17.
//

import UIKit
import AFNetworking
import HandyJSON
class Networking: AFHTTPSessionManager {
    
    static let shared: Networking = Networking()
    
    func request<T>(url: ZlUrl, requestMode: RequestMode = .POST, params: [String: Any]? = nil, modelType: T.Type = Any.self, completion: @escaping (ZJBaseResponseModel<T>?)->Void) {
        let configuration = URLSessionConfiguration.default
        
        let url: URL = URL(string: url.url) ?? URL(string: "")!
        var request = URLRequest(url: url)
        self.setupRequest(request: &request)

        let manager = AFURLSessionManager()
        let dataTasks1 = manager.dataTask(with: request, uploadProgress: nil, downloadProgress: nil) { resposen, data, err in
            if let data = data as? [String: Any]{
                let model = ZJBaseResponseModel<T>.deserialize(from: data)
                completion(model)
            } else {
                completion(nil)
            }
        }
        dataTasks1.resume()
    }
    
    private func setupRequest(request: inout URLRequest) {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
//        request.setValue(version, forHTTPHeaderField: "version")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("19fe91360f7b0b0a8e27d82a3bfef262", forHTTPHeaderField: "ba-user-token")
//        let timestamp = NSDate.getTimeSSInterval()
//        request.setValue(timestamp, forHTTPHeaderField: "timestamp")
        request.setValue("iOS", forHTTPHeaderField: "device")
//        let sign = "SJQ" + timestamp + version
//        self.request.setValue(NetworkTool.md5(sign), forHTTPHeaderField: "sign")
    }
    
    private lazy var request: AFHTTPRequestSerializer = {
        let requestSerializer = AFHTTPRequestSerializer()
        requestSerializer.setValue("iOS", forHTTPHeaderField: "device")
        return requestSerializer
    }()
    
}

class ZJBaseResponseModel<T>: HandyJSON {
    required init() {
        
    }
    
    var code: Int = 0
    var msg: String = ""
    var data: [T]?
    
    
}
