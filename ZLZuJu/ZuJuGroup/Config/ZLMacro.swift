//
//  ZLMacro.swift
//  ZLZuJu
//
//  Created by zcz on 2024/3/12.
//

import UIKit

public func convertPixel(w:CGFloat) -> CGFloat {
    return w/375.0*kScreenWidth()
}

public func convertPixel(h:CGFloat) -> CGFloat {
    return h/812.0*kScreenHeight()
}

public func kScreenHeight() -> CGFloat {
    // 防止横屏启动ScreenHeigth被赋值横屏宽度，某些情况下高度不够
    return UIScreen.main.bounds.height
}
public func kScreenWidth() -> CGFloat {
    // 防止横屏启动ScreenWidth被赋值竖屏高度，某些情况下高度不够
    return UIScreen.main.bounds.width
}
