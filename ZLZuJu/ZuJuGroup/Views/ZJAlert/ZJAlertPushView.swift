//
//  ZJAlertPushView.swift
//  SheJiaoQuan
//
//  Created by ZCZ on 2024/3/17.
//

import UIKit

class ZJAlertPushView: UIView {
    
    private var supView: UIView?
    
    @objc static let shared: ZJAlertPushView = {
       let view = ZJAlertPushView(frame: UIScreen.main.bounds)
        return view
    }()
    
    @objc var callBack: ((Int)->Void)?

    lazy var bgView = {
       let view = UIView()
        view.backgroundColor = color_EEEFF2.withAlphaComponent(0.9)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(hex: "#000000", alpha: 0.3)
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(bgView)
        self.bgView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(252)
            make.height.equalTo(252)
        }
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIColor.white.toImage(), for: .normal)
        button.setTitle("我的动态", for: .normal)
        button.tag = 300
        button.setTitleColor(color_FF528D, for: .normal)
        button.setImage(UIImage(named: "zj_red_arrows"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.titleLabel?.font = UIFont.pingFangSC(ofSize: 14)
        button.layer.cornerRadius = 13
        button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)

        bgView.addSubview(button)
        button.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.top.equalTo(12)
            make.height.equalTo(26)
            make.width.equalTo(86)
        }
        
        let dyButton = UIButton(type: .custom)
        dyButton.tag = 301
        dyButton.setTitle("动态", for: .normal)
        dyButton.setImage(UIImage(named: "vk_dy_picture"), for: .normal)
        dyButton.setTitleColor(color_747475, for: .normal)
        dyButton.titleLabel?.font = UIFont.pingFangSC(ofSize: 14)
        dyButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -56, bottom: -56, right: 0)
        dyButton.imageEdgeInsets = UIEdgeInsets(top: -(dyButton.titleLabel?.intrinsicContentSize.height ?? 0), left: 0, bottom: 0, right: 0)
        dyButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        bgView.addSubview(dyButton)
        dyButton.snp.makeConstraints { make in
            make.left.equalTo(77)
            make.top.equalTo(60)
            make.height.equalTo(80)
            make.width.equalTo(56)
        }
        let zjButton = UIButton(type: .custom)
        zjButton.tag = 302
        zjButton.setImage(UIImage(named: "vk_zj_member"), for: .normal)
        zjButton.setTitle("组局", for: .normal)
        zjButton.setTitleColor(color_747475, for: .normal)
        zjButton.titleLabel?.font = UIFont.pingFangSC(ofSize: 14)
        zjButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -56, bottom: -56, right: 0)
        zjButton.imageEdgeInsets = UIEdgeInsets(top: -(zjButton.titleLabel?.intrinsicContentSize.height ?? 0), left: 0, bottom: 0, right: 0)
        zjButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        bgView.addSubview(zjButton)
        zjButton.snp.makeConstraints { make in
            make.right.equalTo(-77)
            make.top.equalTo(60)
            make.height.equalTo(80)
            make.width.equalTo(56)
        }
        
        let closeButton = UIButton(type: .custom)
        closeButton.setImage(UIImage(named: "zj_close"), for: .normal)
        closeButton.addTarget(self, action: #selector(hidden), for: .touchUpInside)
        bgView.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.width.equalTo(24)
            make.bottom.equalToSuperview().offset(-32)
        }
        self.layoutIfNeeded()
    }
    
    @objc func show(view: UIView) {
        view.addSubview(self)
        self.bgView.snp.updateConstraints { make in
            make.bottom.equalToSuperview()
        }
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func hidden() {
        self.bgView.snp.updateConstraints { make in
            make.bottom.equalToSuperview().offset(252)
        }
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        } completion: { _ in
            self.removeFromSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        if let block = self.callBack {
            block(sender.tag)
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
