//
//  ZJGroupInfoCell.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/12.
//

import UIKit

class ZJGroupInfoCell: ZJGroupBaseCell {

        
    lazy var decLabel = {
       let lab = UILabel()
        lab.font = UIFont.pingFangSC(ofSize: 16)
        lab.textAlignment = .right
        lab.textColor = color_747475
        return lab
    }()
    
    lazy var arrows = {
       let view = UIImageView()
        view.image = UIImage(named: "zj_arrows")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    
    override func setupUI() {
        super.setupUI()
        
        self.contentView.addSubview(decLabel)
        self.contentView.addSubview(arrows)
        arrows.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
        decLabel.snp.makeConstraints { make in
            make.right.equalTo(arrows.snp.left).offset(-4)
            make.centerY.equalTo(arrows)
            make.top.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
            make.height.greaterThanOrEqualTo(24)
        }
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
