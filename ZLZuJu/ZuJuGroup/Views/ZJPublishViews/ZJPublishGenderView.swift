//
//  ZJPublishGenderView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/10.
//

import UIKit

class ZJPublishGenderView: UIView {
    
    private func setButtonData(_ button: UIButton) {
        button.setBackgroundImage(UIColor(hex: "#F7F7F7").toImage(), for: .normal)
        button.setBackgroundImage(UIColor(hex: "#FF528D").toImage(), for: .selected)
        button.setTitleColor(UIColor.white, for: .selected)
        button.setTitleColor(UIColor(hex: "#2D282A"), for: .normal)
        button.clipsToBounds = true
    }
    
    @IBOutlet weak var noLimitButton: UIButton! {
        didSet {
            setButtonData(noLimitButton)
        }
    }
    
    @IBOutlet weak var manButton: UIButton! {
        didSet {
            setButtonData(manButton)
        }
    }
    
    @IBOutlet weak var girlButton: UIButton! {
        didSet {
            setButtonData(girlButton)
        }
    }
    
    @IBOutlet weak var ageLabel: UILabel!
    
    private var selectedGender: UIButton? {
        didSet {
            oldValue?.isSelected = false
            selectedGender?.isSelected = true
        }
    }
    
    @IBOutlet weak var authenticationLabel: UILabel!
    @IBAction func nolimitAction(_ sender: UIButton) {
        selectedGender = sender
    }
    
    @IBAction func manAAction(_ sender: UIButton) {
        selectedGender = sender
    }
    
    @IBAction func girlAction(_ sender: UIButton) {
        selectedGender = sender
    }
    
    
    @IBAction func selectAgeAction(_ sender: Any) {
    }
    
    @IBAction func authentication(_ sender: Any) {
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
