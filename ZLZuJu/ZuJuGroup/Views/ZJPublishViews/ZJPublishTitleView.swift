//
//  ZJPublishTitleView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/10.
//

import UIKit

class ZJPublishTitleView: UIView, UITextViewDelegate {

    @IBOutlet weak var titleView: UITextView! {
        didSet {
            titleView.delegate = self
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty == false {
            placeHolder.isHidden = true
        } else {
            placeHolder.isHidden = false
        }
    }
    
    @IBOutlet weak var placeHolder: UILabel!
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
