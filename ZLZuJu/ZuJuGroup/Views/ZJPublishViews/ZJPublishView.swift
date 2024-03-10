//
//  ZJPublishView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/10.
//

import UIKit

class ZJPublishView: UIView {
    
    private lazy var rootView: UIScrollView = {
       let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing

        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var agreedBgView = {
        let view  = UIView()
        view.backgroundColor = UIColor.white
        view.addSubview(agreeButton)
        let lab = UILabel()
        lab.text = "已阅读并同意约会声明"
        lab.textAlignment = .left
        lab.font = UIFont.pingFangSCMedium(ofSize: 14)
        lab.textColor = UIColor(hex: "#2D282A")
        view.addSubview(lab)
        let sureBtn = UIButton(type: .custom)
        sureBtn.setTitle("确定发布", for: .normal)
        sureBtn.setTitleColor(UIColor.white, for: .normal)
        sureBtn.titleLabel?.font = UIFont.pingFangSC(ofSize: 16)
        sureBtn.setBackgroundImage(UIColor(hex: "#FF528D").toImage(), for: .normal)
        sureBtn.addTarget(self, action: #selector(sureAction(_:)), for: .touchUpInside)
        sureBtn.layer.cornerRadius = 4
        sureBtn.clipsToBounds = true
        view.addSubview(sureBtn)
        
        agreeButton.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.top.equalTo(20)
            make.width.height.equalTo(20)
        }
        
        lab.snp.makeConstraints { make in
            make.centerY.equalTo(agreeButton)
            make.left.equalTo(agreeButton.snp.right).offset(4)
        }
        
        sureBtn.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.top.equalTo(10)
            make.width.equalTo(153)
            make.height.equalTo(40)
        
        }
        
        return view
    }()
    
    private lazy var agreeButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: "zj_unAgreed"), for: .normal)
        btn.setImage(UIImage(named: "zj_agreed"), for: .selected)
        btn.imageView?.contentMode = .center
        btn.addTarget(self, action: #selector(agreedAction(_ :)), for: .touchUpInside)
        return btn
    }()
    
    @objc func agreedAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @objc func sureAction(_ sender: UIButton) {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(rootView)
        rootView.addSubview(stackView)
        rootView.addSubview(agreedBgView)
        
        rootView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
            make.width.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.width.equalToSuperview()
        }
        agreedBgView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.left.equalToSuperview()
            make.width.equalTo(self.frame.width)
            make.height.equalTo(60)
            make.bottom.equalToSuperview()
        }
        
        let titleView = Bundle.main.loadNibNamed("ZJPublishTitleView", owner: self)?.first as! ZJPublishTitleView
        let pThemeView = Bundle.main.loadNibNamed("ZJPublishThemeView", owner: self)?.first as! ZJPublishThemeView
        let pConditionView = Bundle.main.loadNibNamed("ZJPublishConditionView", owner: self)?.first as! ZJPublishConditionView
        let pGenderView = Bundle.main.loadNibNamed("ZJPublishGenderView", owner: self)?.first as! ZJPublishGenderView
        stackView.addArrangedSubview(titleView)
        stackView.addArrangedSubview(pThemeView)
        stackView.addArrangedSubview(pConditionView)
        stackView.addArrangedSubview(pGenderView)
        
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
