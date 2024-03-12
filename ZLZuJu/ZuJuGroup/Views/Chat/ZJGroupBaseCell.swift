//
//  ZJGroupBaseCell.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/12.
//

import UIKit

class ZJGroupBaseCell: UITableViewCell {
    
    lazy var titleLabel = {
       let lab = UILabel()
        lab.font = UIFont.pingFangSC(ofSize: 16)
        lab.textAlignment = .left
        lab.textColor = UIColor(hex: "#000000", alpha: 0.9)
        return lab
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
