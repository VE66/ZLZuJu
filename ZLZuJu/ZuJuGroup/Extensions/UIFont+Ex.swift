//
//  UIFont+Ex.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/4.
//

import UIKit

extension UIFont {
    /// ***********平方字体****************
    public class func pingFangSC(ofSize size: CGFloat) -> UIFont {
        return pingFangSCRegular(ofSize: size)
    }

    public class func pingFangSCUltralight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Ultralight", size: size) ?? UIFont.systemFont(ofSize: size)
    }

    public class func pingFangSCRegular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }

    public class func pingFangSCLight(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Light", size: size) ?? UIFont.systemFont(ofSize: size)
    }

    public class func pingFangSCMedium(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }

    public class func pingFangSCSemibold(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Semibold", size: size) ?? UIFont.systemFont(ofSize: size)
    }

    public class func pingFangSCThin(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "PingFangSC-Thin", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
