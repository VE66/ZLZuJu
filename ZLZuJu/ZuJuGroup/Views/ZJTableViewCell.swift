//
//  ZJTableViewCell.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/2.
//

import UIKit
import Kingfisher

class ZJTableViewCell: UITableViewCell {
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#FFFFFF")
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        return view
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
        return view
    }()
    
    private lazy var paymentBgView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(hex: "#F5F6F6")
        view.addSubview(paymentLable)
        view.layer.cornerRadius = 12
        paymentLable.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(-8)
            make.centerY.equalToSuperview()
        }
        return view
    }()
    
    private lazy var paymentLable: UILabel = {
       let lab = UILabel()
        lab.textColor = UIColor(hex: "#FF528D")
        lab.font = UIFont.pingFangSC(ofSize: 14)
        lab.textAlignment = .center
        return lab
    }()
    
    private lazy var titleLable: UILabel = {
       let lab = UILabel()
        lab.numberOfLines = 0
        lab.textColor = UIColor(hex: "#19191C")
        lab.font = UIFont.pingFangSC(ofSize: 16)
        lab.textAlignment = .left
        return lab
    }()
    
    private lazy var dottedLine: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "zj_dotted_line")
        return view
    }()
    
    private lazy var timeBgView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F6F6F6")
        view.layer.cornerRadius = 4
        view.addSubview(timeTitleLab)
        view.addSubview(timeLab)
        timeTitleLab.snp.makeConstraints { make in
            make.left.equalTo(6)
            make.centerY.equalToSuperview()
        }
        timeLab.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-6)
            make.centerY.equalToSuperview()
        }
        return view
    }()
    
    private lazy var timeTitleLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor(hex: "#817E7F")
        lab.font = UIFont.pingFangSC(ofSize: 14)
        lab.text = "组局时间："
        return lab
    }()
    
    private lazy var timeLab: UILabel = {
        let lab = UILabel()
        lab.textColor = UIColor(hex: "#2D282A")
        lab.font = UIFont.pingFangSC(ofSize: 14)
        lab.text = "组局时间："
        return lab
    }()
    
    private lazy var memberImages: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }()

    private lazy var memberLable: UILabel = {
       let lab = UILabel()
        return lab
    }()
    
    private lazy var addressLable: UILabel = {
       let lab = UILabel()
        lab.textColor = UIColor(hex: "#19191C")
        lab.font = UIFont.pingFangSC(ofSize: 13)
        return lab
    }()
    
    weak var currentModel: ZJListModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        self.selectionStyle = .none
        setupUI()
    }
    
    private func setupUI() {
        self.contentView.addSubview(bgView)
        bgView.addSubview(organizerBgView)
        bgView.addSubview(ageBgView)
        bgView.addSubview(vipTipImage)
        bgView.addSubview(paymentBgView)
        bgView.addSubview(titleLable)
        bgView.addSubview(dottedLine)
        bgView.addSubview(timeBgView)
        bgView.addSubview(memberImages)
        bgView.addSubview(memberLable)
        bgView.addSubview(addressLable)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        bgView.snp.makeConstraints { make in
            make.top.equalTo(6)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalTo(-6)
        }
        
        organizerBgView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.top.equalTo(14)
            make.height.equalTo(25)
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
        
        paymentBgView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-12)
            make.centerY.equalTo(vipTipImage)
            make.height.equalTo(24)
        }
        
        titleLable.snp.makeConstraints { make in
            make.left.equalTo(organizerBgView)
            make.top.equalTo(organizerBgView.snp.bottom).offset(10)
            make.right.lessThanOrEqualToSuperview()
        }
        
        dottedLine.snp.makeConstraints { make in
            make.top.equalTo(titleLable.snp.bottom).offset(12)
            make.height.equalTo(0.5)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
        }
        
        timeBgView.snp.makeConstraints { make in
            make.top.equalTo(dottedLine.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().offset(-12)
            make.height.equalTo(26)
        }
        
        memberImages.snp.makeConstraints { make in
            make.top.equalTo(timeBgView.snp.bottom).offset(12)
            make.left.equalToSuperview().offset(12)
            make.height.equalTo(24)
            make.bottom.equalToSuperview().offset(-16)
        }
        
        memberLable.snp.makeConstraints { make in
            make.left.equalTo(memberImages.snp.right).offset(12)
            make.centerY.equalTo(memberImages)
        }
        
        addressLable.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-12)
            make.centerY.equalTo(memberImages)
        }
        
    }
    
    func setData(_ model: ZJListModel) {
        self.currentModel = model
        organizerLable.text = model.organizer ?? ""
        if model.gender == .man {
            genderTipImage.image = UIImage(named: "zu_man")
        } else {
            genderTipImage.image = UIImage(named: "zj_girl")
        }
        ageLable.text = String(model.age) + "岁"
        
        vipTipImage.isHidden = !model.isVip
        paymentLable.text = model.paymentState.value
        
        titleLable.attributedText = setTitleAttring(model.title ?? "", type: model.activityType.value)
        
        timeLab.text = model.time
        
        getMemberImages()
        memberLable.text = "4/12 组局中"
        addressLable.text = model.address
    }
    
    private func setTitleAttring(_ text: String, type: String?) -> NSAttributedString {
        let attr = NSMutableAttributedString(string: text)
        attr.setAttributes([.font: UIFont.pingFangSC(ofSize: 16), .foregroundColor: UIColor(hex: "#19191C")], range: NSRange(location: 0, length: text.count))
        let textAttach = getLableString(type ?? "体育活动")
        
        let attchAttributeStr = NSAttributedString(attachment: textAttach)
        
        attr.append(attchAttributeStr)
        return attr
    }
    
    private func getLableString(_ text: String) -> NSTextAttachment {
        let color = UIColor(hex: "#FF7D36")
        let lab = UILabel()
        lab.font = UIFont.pingFangSC(ofSize: 11)
        lab.textAlignment = .center
        lab.layer.borderWidth = 1
        lab.layer.cornerRadius = 4
        lab.layer.borderColor = color.cgColor
        lab.text = text
        lab.textColor = color
        lab.sizeToFit()
        var frame = lab.frame
        frame.size.width += 8
//        frame.size.height += 2
        lab.frame = frame
        
        let attach = NSTextAttachment(image: lab.toImageView())
        attach.bounds = CGRect(x: 4, y: -2, width: frame.width, height: frame.height)
        return attach
        
    }
    
    private func getMemberImages() {
        for view in memberImages.subviews {
            view.removeFromSuperview()
        }
        
        var count = currentModel?.teamMember?.count ?? 0
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
                    memberImages.addSubview(imageView)
                    imageView.snp.makeConstraints { make in
                        make.left.equalToSuperview().offset(CGFloat(i)*15.5)
                        make.centerY.equalToSuperview()
                        make.width.height.equalTo(24)
                    }
                }
                
            }
            
            let width = CGFloat(count) * 15.5 + 24.0
            memberImages.snp.remakeConstraints { make in
                make.top.equalTo(timeBgView.snp.bottom).offset(12)
                make.left.equalToSuperview().offset(12)
                make.height.equalTo(24)
                make.width.equalTo(width)
                make.bottom.equalToSuperview().offset(-16)
            }
            
        }
        func creatImage(name: String? = nil, url: String? = nil) -> UIImageView {
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
