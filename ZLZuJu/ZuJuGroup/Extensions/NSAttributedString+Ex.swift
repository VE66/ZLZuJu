//
//  NSAttributedString+Ex.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/11.
//

import UIKit

extension NSAttributedString {
    static func setTitleAttring(_ text: String, textFont: UIFont = UIFont.pingFangSC(ofSize: 16), textColor: UIColor = UIColor(hex: "#19191C"), labtext: String?, labfont: UIFont = UIFont.pingFangSC(ofSize: 11), labTextColor: UIColor = color_FF7D36) -> NSAttributedString {
        let attr = NSMutableAttributedString(string: text)
        attr.setAttributes([.font: textFont, .foregroundColor: textColor], range: NSRange(location: 0, length: text.count))
        if let labtext = labtext {
            let textAttach = getLableString(labtext, font: labfont, color: labTextColor)
            let attchAttributeStr = NSAttributedString(attachment: textAttach)
            attr.append(attchAttributeStr)
        }
        return attr
    }
    
    static func getLableString(_ text: String, font: UIFont = UIFont.pingFangSC(ofSize: 11), color: UIColor) -> NSTextAttachment {
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
        frame.size.height += 6
        lab.frame = frame
        
        let attach = NSTextAttachment(image: lab.toImageView())
        attach.bounds = CGRect(x: 4, y: -5, width: frame.width, height: frame.height)
        return attach
        
    }
}
