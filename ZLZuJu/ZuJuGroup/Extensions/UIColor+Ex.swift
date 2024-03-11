//
//  UIColor+Ex.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/2.
//

import UIKit

extension UIColor {
    convenience init(hex string: String, alpha: CGFloat = 1) {
        var hex = string.hasPrefix("#") ? String(string.dropFirst()) : string
        guard hex.count == 3 || hex.count == 6 || hex.count == 8 else {
            self.init(white: 1.0, alpha: 0.0)
            return
        }
        
        var a: CGFloat = alpha
        
        if hex.count == 8 {
            let alphaHex = hex.vh_subStringTo(index: 1)
            guard let alphaCode = Int(alphaHex, radix: 16) else {
                self.init(white: 1.0, alpha: 0.0)
                return
            }
            a = CGFloat((alphaCode) & 0xFF) / 255.0
            
            hex = hex.vh_subStringFrom(index: 2)
        }
        
        if hex.count == 3 {
            for (index, char) in hex.enumerated() {
                hex.insert(char, at: hex.index(hex.startIndex, offsetBy: index * 2))
            }
        }
      
        guard let intCode = Int(hex, radix: 16) else {
            self.init(white: 1.0, alpha: 0.0)
            return
        }
      
        self.init(
            red: CGFloat((intCode >> 16) & 0xFF) / 255.0,
            green: CGFloat((intCode >> 8) & 0xFF) / 255.0,
            blue: CGFloat((intCode) & 0xFF) / 255.0, alpha: a)
    }
    
    func toImage(viewSize: CGSize = CGSize(width: 1, height: 1)) -> UIImage{
        let rect: CGRect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(self.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        return image!
    }
}

/// 主题红
let color_FF528D = "#FF528D"
/// 背景灰白
let color_F6F6F6 = "#F6F6F6"
/// 背景灰白2
let color_F5F6F6 = "#F5F6F6"
/// 主题黑
let color_19191C = "#19191C"
/// 黑2
let color_2D282A = "#2D282A"
/// 灰黑
let color_747475 = "#747475"
/// 灰
let color_817E7F = "#817E7F"
/// 浅灰
let color_888888 = "#888888"
/// 淡蓝
let color_577CFF = "#577CFF"
/// 橙色
let color_FF7D36 = "#FF7D36"
