//
//  ZJGroupInfoSwitchCell.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/12.
//

import UIKit

class ZJGroupInfoSwitchCell: ZJGroupBaseCell {

    
    lazy var switchView = {
        let view = UISwitch()
        view.onTintColor = color_FF528D
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
