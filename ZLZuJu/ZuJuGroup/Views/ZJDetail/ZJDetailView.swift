//
//  ZJDetailView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/11.
//

import UIKit

class ZJDetailView: UIView {
    
    lazy var scrollView = {
       let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        return view
    }()
    
    lazy var topImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "zj_detailTopView ")
        return imageView
    }()
    
    lazy var contentBgView = {
       let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
        return view
    }()
    
    lazy var demandBgView = {
       let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
        return view
    }()
    
    lazy var bottomBgView = {
       let view = UIView()
        view.backgroundColor = UIColor.white
        let btn = UIButton(type: .custom)
        btn.setTitle("进入群聊", for: .normal)
        btn.setBackgroundImage(UIColor(hex: color_FF528D).toImage(), for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.titleLabel?.font = UIFont.pingFangSC(ofSize: 16)
        btn.layer.cornerRadius = 4
        btn.clipsToBounds = true
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.left.equalTo(16)
            make.top.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(40)
        }
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        scrollView.addSubview(contentBgView)
        scrollView.addSubview(demandBgView)
        scrollView.addSubview(bottomBgView)
        contentBgView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }
        demandBgView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(contentBgView.snp.bottom).offset(6)
        }
        bottomBgView.snp.makeConstraints { make in
            make.top.equalTo(demandBgView.snp.bottom).offset(46)
            make.left.bottom.right.equalToSuperview()
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

extension ZJDetailView {
    func setConditionView() {
        
    }
    
    func setdemandView() {
        
    }
}
