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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(rootView)
        rootView.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
            make.width.equalToSuperview()
        }
        rootView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
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
