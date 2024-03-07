//
//  ZJFilterView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/7.
//

import UIKit

class ZJFilterViewController: UIViewController {
    
    lazy var bgView = {
       let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#000000", alpha: 0.4)
        
        self.view.addSubview(bgView)
        bgView.snp.makeConstraints { make in
            make.right.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(428)
            make.height.equalTo(428)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bgView.snp.remakeConstraints { make in
            make.bottom.right.left.equalToSuperview()
            make.height.equalTo(428)
        }
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 10, initialSpringVelocity: 10) {
            self.bgView.superview?.layoutIfNeeded()
        }
        
    }
}

class ZJFilterView: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    

    
    private func setupUI() {
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
