//
//  UIView+Ex.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/6.
//

import UIKit

extension UIView {
     func toImageView() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        var targetImage = UIImage()
        if let ctx = UIGraphicsGetCurrentContext() {
            self.layer.render(in: ctx)
            targetImage = UIGraphicsGetImageFromCurrentImageContext()!
        }
        UIGraphicsEndImageContext()
        return targetImage
    }
}
