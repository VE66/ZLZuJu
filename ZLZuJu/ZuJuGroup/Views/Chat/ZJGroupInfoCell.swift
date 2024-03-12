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

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
