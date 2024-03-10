//
//  ZJPublishConditionView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/10.
//

import UIKit

class ZJPublishConditionView: UIView, UITextViewDelegate {
    
    
    @IBOutlet weak var ZJDateButton: UIControl!
    
    @IBOutlet weak var ZJTimeButton: UIControl!
    
    @IBOutlet weak var ZJCityButton: UIControl!
    
    @IBOutlet weak var ZJPeopleCountButton: UIControl!
    
    @IBOutlet weak var descriptionTextView: UITextView! {
        didSet {
            descriptionTextView.delegate = self
        }
    }
    
    @IBOutlet weak var placeHolder: UILabel!
    
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty == true {
            placeHolder.isHidden = false
        } else {
            placeHolder.isHidden = true
        }
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
