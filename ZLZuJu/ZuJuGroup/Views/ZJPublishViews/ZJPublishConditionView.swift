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
    
    
    @IBAction func dateSelectAction(_ sender: UIControl) {
    }
    
    
    @IBAction func timeSelectAction(_ sender: UIControl) {
    }
    
    @IBAction func addressSelectAction(_ sender: UIControl) {
    }
    
    @IBAction func peopleSelectAction(_ sender: UIControl) {
    }
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    
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
