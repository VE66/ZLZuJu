//
//  ZJTableViewCell.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/2.
//

import UIKit

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
        view.backgroundColor = UIColor(hex: "#577CFF", alpha: 0.1)
        view.addSubview(ageTipImage)
        view.addSubview(ageLable)
        ageTipImage.snp.makeConstraints { make in
            make.left.equalTo(4)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(12)
        }
        ageLable.snp.makeConstraints { make in
            make.left.equalTo(ageTipImage.snp.right).offset(4)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-4)
        }
        return view
    }()
    
    private lazy var ageTipImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 6
        return view
    }()
    
    private lazy var ageLable = {
       let lab = UILabel()
        lab.font = UIFont.pingFangSC(ofSize: 1)
        lab.textColor = UIColor(hex: "#2D282A")
        return lab
    }()
    
    private lazy var vipTipImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
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
        view.backgroundColor = UIColor(hex: "#577CFF", alpha: 0.1)
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        setupUI()
    }
    
    func setupUI() {
        self.contentView.addSubview(bgView)
        bgView.addSubview(organizerBgView)
        bgView.addSubview(ageBgView)
        bgView.addSubview(vipTipImage)
        bgView.addSubview(paymentLable)
        bgView.addSubview(titleLable)
        bgView.addSubview(dottedLine)
        bgView.addSubview(timeBgView)
        bgView.addSubview(memberImages)
        bgView.addSubview(memberLable)
        bgView.addSubview(addressLable)
        
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
