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
    
    static func getMembersView(_ items: [String]?, itemSize: CGSize = CGSize(width: 28, height: 28), space: CGFloat = 15.5) -> UIView {
        let view = UIView()
        var count = items?.count ?? 0
        if count > 0 {
            if count > 4 {
                count = 4
            }
            
            for i in 0...count {
                var imageView: UIImageView?
                if i == 4 {
                    imageView = creatImage(name: "zj_list_more")
                } else {
                    imageView = creatImage()
                }
                
                if let imageView = imageView {
                    view.addSubview(imageView)
                    imageView.snp.makeConstraints { make in
                        make.left.equalToSuperview().offset(CGFloat(i)*space)
                        make.centerY.equalToSuperview()
                        make.size.equalTo(itemSize)
                    }
                }
                
            }
            
            let width = CGFloat(count) * space + itemSize.width
            view.frame = CGRect(x: 0, y: 0, width: width, height: itemSize.height)
            
        }
        return view
    }
    
    static func creatImage(name: String? = nil, url: String? = nil) -> UIImageView {
        let imageView = UIImageView()
        if let name = name, name.isEmpty == false {
            imageView.image = UIImage(named: name)
        } else if let url = url, url.isEmpty == false, let uRL = URL(string: url) {
            imageView.kf.setImage(with: .network(uRL))
        } else {
            imageView.backgroundColor = UIColor.red
        }
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        imageView.layer.cornerRadius = 12
        return imageView
    }
        
    
}
