//
//  ZJLocalView.swift
//  SheJiaoQuan
//
//  Created by ZCZ on 2024/3/15.
//

import UIKit

enum ZJLocalAction {
    case near, newest, filter
    
    var name: String {
        switch self {
        case .near:
            return "附近"
        case .newest:
            return "最新"
        case .filter:
            return "筛选"
        }
    }
    
    var tag: Int {
        switch self {
        case .near:
            return 200
        case .newest:
            return 201
        case .filter:
            return 202
        }
    }
    
}

class ZJLocalView: UIView {
    
    private var currentButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        let btn1 = creatButton(.near)
        let btn2 = creatButton(.newest)
        let btn3 = creatButton(.filter, imageName: "zj_caret_down_small")
        btn1.isSelected = true
        currentButton = btn1
        self.addSubview(btn1)
        self.addSubview(btn2)
        self.addSubview(btn3)
        
        btn1.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.top.equalToSuperview().offset(17)
            make.height.equalTo(22)
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        btn2.snp.makeConstraints { make in
            make.left.equalTo(btn1.snp.right).offset(24)
            make.top.height.equalTo(btn1)
            make.bottom.lessThanOrEqualToSuperview()
        }
        
        btn3.snp.makeConstraints { make in
            make.top.height.equalTo(btn1)
            make.right.equalToSuperview().offset(-16)
        }

    }
    
    private func creatButton(_ mode: ZJLocalAction, imageName: String = "") -> UIButton {
        let button = UIButton(type: .custom)
        button.setAttributedTitle(NSAttributedString(string: mode.name, attributes: [.font: UIFont.pingFangSC(ofSize: 15), .foregroundColor: color_747475]), for: .normal)
        button.setAttributedTitle(NSAttributedString(string: mode.name, attributes: [.font: UIFont.pingFangSCMedium(ofSize: 16), .foregroundColor: color_19191C]), for: .selected)
        button.addTarget(self, action: #selector(selectAction(_:)), for: .touchUpInside)
        button.tag = mode.tag
        if imageName.isEmpty == false {
            button.setImage(UIImage(named: imageName), for: .normal)
            button.semanticContentAttribute = UISemanticContentAttribute.forceRightToLeft
        }
        return button
    }
    
    @objc func selectAction(_ sender: UIButton) {
        if currentButton != sender {
            currentButton?.isSelected = false
            sender.isSelected = true
            currentButton = sender
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
