//
//  NSAttributedString+Ex.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/11.
//

import UIKit

extension NSAttributedString {
    static func setTitleAttring(_ text: String, labtext: String?, labTextColor: UIColor = UIColor(hex: color_FF7D36)) -> NSAttributedString {
        let attr = NSMutableAttributedString(string: text)
        attr.setAttributes([.font: UIFont.pingFangSC(ofSize: 16), .foregroundColor: UIColor(hex: "#19191C")], range: NSRange(location: 0, length: text.count))
        if let labtext = labtext {
            let textAttach = getLableString(labtext, color: labTextColor)
            let attchAttributeStr = NSAttributedString(attachment: textAttach)
            attr.append(attchAttributeStr)
        }
        return attr
    }
    
    static func getLableString(_ text: String, color: UIColor) -> NSTextAttachment {
        let lab = UILabel()
        lab.font = UIFont.pingFangSC(ofSize: 11)
        lab.textAlignment = .center
        lab.layer.borderWidth = 1
        lab.layer.cornerRadius = 4
        lab.layer.borderColor = color.cgColor
        lab.text = text
        lab.textColor = color
        lab.sizeToFit()
        var frame = lab.frame
        frame.size.width += 10
        lab.frame = frame
        
        let attach = NSTextAttachment(image: lab.toImageView())
        attach.bounds = CGRect(x: 4, y: -2, width: frame.width, height: frame.height)
        return attach
        
    }
}
