//
//  ZJDetailView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/11.
//

import UIKit

class ZJDetailView: UIView {
    
    private let leftMargin: CGFloat = 14
    private let rightMargin: CGFloat = 16
    private let itemSpace: CGFloat = 16

    lazy var scrollView = {
       let view = UIScrollView()
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.contentInsetAdjustmentBehavior = .never
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var topImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "zj_detailTopView")
        return imageView
    }()
    
    lazy var contentBgView = {
       let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner, CACornerMask.layerMaxXMinYCorner]
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel = {
        let lab = UILabel()
        lab.font = UIFont.pingFangSCMedium(ofSize: 17)
        lab.textAlignment = .left
        lab.numberOfLines = 0
        return lab
    }()
    
    private lazy var organizerBgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F5F6F6")
        view.layer.cornerRadius = 25/2.0
        view.addSubview(avater)
        view.addSubview(organizerLable)
        avater.snp.makeConstraints { make in
            make.left.equalTo(4)
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
        }
        organizerLable.snp.makeConstraints { make in
            make.left.equalTo(avater.snp.right).offset(4)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-8)
        }
        return view
    }()
    
    private lazy var avater: UIImageView = {
       let img = UIImageView()
        img.layer.cornerRadius = 10
        img.backgroundColor = UIColor.red
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private lazy var organizerLable = {
       let lab = UILabel()
        lab.font = UIFont.pingFangSC(ofSize: 15)
        lab.textColor = UIColor(hex: "#2D282A", alpha: 0.8)
        return lab
    }()

    private lazy var ageBgView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(hex: "#577CFF", alpha: 0.1)
        view.addSubview(genderTipImage)
        view.addSubview(ageLable)
        genderTipImage.snp.makeConstraints { make in
            make.left.equalTo(4)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(12)
        }
        ageLable.snp.makeConstraints { make in
            make.left.equalTo(genderTipImage.snp.right).offset(4)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-4)
        }
        return view
    }()
    
    private lazy var genderTipImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 6
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var ageLable = {
       let lab = UILabel()
        lab.font = UIFont.pingFangSC(ofSize: 16)
        lab.textColor = UIColor(hex: "#2D282A")
        return lab
    }()
    
    private lazy var vipTipImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "zj_vip")
        return view
    }()
    
    private lazy var descriptionLabel = {
        let lab = UILabel()
        lab.textColor = color_747475
        lab.font = UIFont.pingFangSC(ofSize: 16)
        lab.numberOfLines = 0
        return lab
    }()
    
    lazy var numberLabel = {
        let lab = UILabel()
        lab.textAlignment = .left
        //--- 中粗16号 组局中  中粗 15号 4 /12 15常规
        lab.font = UIFont.pingFangSC(ofSize: 16)
        return lab
    }()
    
    lazy var memberImageView = {
        let view = UIView()
        return view
    }()
    
    lazy var addressLabel = {
        let lab = UILabel()
        lab.textAlignment = .left
        //--- 中粗16号 组局中  中粗 15号 4 /12 15常规
        lab.font = UIFont.pingFangSC(ofSize: 16)
        lab.numberOfLines = 0
        return lab
    }()
    
    lazy var timeTitleLabel = {
        let lab = UILabel()
        lab.textAlignment = .left
        lab.textColor = color_747475
        lab.text = "发布时间："
        lab.font = UIFont.pingFangSC(ofSize: 14)
        return lab
    }()
    
    lazy var timeLabel = {
        let lab = UILabel()
        lab.textAlignment = .right
        lab.textColor = color_747475
        lab.font = UIFont.pingFangSC(ofSize: 14)
        return lab
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
        btn.setBackgroundImage(color_FF528D.toImage(), for: .normal)
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
        self.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.width.equalTo(self)
        }
        
        scrollView.addSubview(topImageView)
        scrollView.addSubview(contentBgView)
        scrollView.addSubview(demandBgView)
        scrollView.addSubview(bottomBgView)
        topImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.height.equalTo(convertPixel(h: 280.0))
        }
        contentBgView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
            make.top.equalTo(topImageView.snp.bottom).offset(-46)
        }
        demandBgView.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self)
            make.top.equalTo(contentBgView.snp.bottom).offset(6)
        }
        bottomBgView.snp.makeConstraints { make in
            make.top.equalTo(demandBgView.snp.bottom).offset(46)
            make.left.bottom.right.equalTo(self)
        }
        
        setConditionView()
        
        setdata()
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
        contentBgView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(16)
            make.left.equalTo(leftMargin)
            make.right.equalToSuperview().offset(-rightMargin)
        }
        
        contentBgView.addSubview(organizerBgView)
        contentBgView.addSubview(ageBgView)
        contentBgView.addSubview(vipTipImage)
        
        organizerBgView.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(itemSpace)
            make.height.equalTo(28)
        }
        
        ageBgView.snp.makeConstraints { make in
            make.left.equalTo(organizerBgView.snp.right).offset(12)
            make.centerY.equalTo(organizerBgView)
            make.height.equalTo(20)
        }
        
        vipTipImage.snp.makeConstraints { make in
            make.left.equalTo(ageBgView.snp.right).offset(8)
            make.centerY.equalTo(ageBgView)
        }
        
        // 描述---
        contentBgView.addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(leftMargin)
            make.right.equalTo(-rightMargin)
            make.top.equalTo(organizerBgView.snp.bottom).offset(itemSpace)
        }
        let line0 = getlineview()
        contentBgView.addSubview(line0)
        line0.snp.makeConstraints { make in
            make.left.equalTo(leftMargin)
            make.right.equalTo(-rightMargin)
            make.height.equalTo(0.5)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(itemSpace)
        }
        
        // 接受人数
        //--- 中粗16号 组局中  中粗 15号 4 /12 15常规
        contentBgView.addSubview(numberLabel)
        numberLabel.snp.makeConstraints { make in
            make.left.equalTo(leftMargin + 6)
            make.top.equalTo(line0.snp.bottom).offset(11)
        }
        
        contentBgView.addSubview(memberImageView)
        let members = UIView.getMembersView(["","",""], space: 18.5)
        memberImageView.addSubview(members)
        memberImageView.snp.makeConstraints { make in
            make.right.equalTo(-rightMargin)
            make.height.equalTo(24)
            make.width.equalTo(members.frame.width)
            make.top.equalTo(line0.snp.bottom).offset(8)
        }
        
        ///发布 地址
        let line1 = getlineview()
        contentBgView.addSubview(line1)
        line1.snp.makeConstraints { make in
            make.left.equalTo(leftMargin)
            make.right.equalTo(-rightMargin)
            make.height.equalTo(0.5)
            make.top.equalTo(line0.snp.bottom).offset(44)
        }

        contentBgView.addSubview(addressLabel)
        addressLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(leftMargin + 6)
            make.top.equalTo(line1.snp.bottom).offset(12)
            make.right.lessThanOrEqualToSuperview().offset(-90)
        }
        let addreeImage = UIImageView(image: UIImage(named: "zj_localtion"))
        addreeImage.contentMode = .scaleAspectFit
        contentBgView.addSubview(addreeImage)
        addreeImage.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-18)
            make.centerY.equalTo(addressLabel)
            make.width.height.equalTo(24)
        }
        
        // 发布时间
        let line2 = getlineview()
        contentBgView.addSubview(line2)
        line2.snp.makeConstraints { make in
            make.left.equalTo(leftMargin)
            make.right.equalTo(-rightMargin)
            make.height.equalTo(0.5)
            make.top.equalTo(addressLabel.snp.bottom).offset(12)
        }

        contentBgView.addSubview(timeTitleLabel)
        contentBgView.addSubview(timeLabel)
        timeTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(line2).offset(12)
            make.left.equalTo(20)
            make.bottom.equalToSuperview().offset(-24)
        }
        timeLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(timeTitleLabel)
        }
    }
    
    func getlineview() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#000000", alpha: 0.06)
        return view
    }
    
    func setdemandView() {
        
        
        func getItemView(_ title: String, content: String, imageName: String) -> UIView {
            let bgView = UIView()
            let imageView = UIImageView(image: UIImage(named: imageName))
            imageView.contentMode = .scaleAspectFit
            bgView.addSubview(bgView)
            return bgView
        }
    }
    
    func setdata() {
        setConditionData()
    }
    
    private func setConditionData() {
        titleLabel.attributedText = NSAttributedString.setTitleAttring("羽毛球爱好者周末挥拍聚会！", textFont: UIFont.pingFangSCMedium(ofSize: 17), labtext: "体育活动", labfont: UIFont.pingFangSC(ofSize: 13))
        
        organizerLable.text = "往事随风"
        ageLable.text = "32岁"
//        if model.gender == .man {
            genderTipImage.image = UIImage(named: "zu_man")
//        } else {
//            genderTipImage.image = UIImage(named: "zj_girl")
//        }
        
        vipTipImage.isHidden = false

        numberLabel.attributedText = NSAttributedString(string: "组局中  4/12", attributes: [.foregroundColor: color_FF528D])
        descriptionLabel.text = "本周六下午，椒江区羽毛球馆见！2点到5点，一起打球、聊天！结束还可以约个晚饭～"
        addressLabel.text = "台州市 椒江区 某某路某某体育馆 \n台州市 椒江区 某某路某某体育馆"
        
        timeLabel.text = "2023-08-30 02:22"

    }
}
