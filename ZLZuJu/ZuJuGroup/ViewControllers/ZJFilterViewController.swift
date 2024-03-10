//
//  ZJFilterViewController.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/7.
//

import UIKit

class ZJFilterViewController: UIViewController {
    
    lazy var bgView: UIView = {
        let view = Bundle.main.loadNibNamed("ZFilterView", owner: self)?.first as! ZFilterView
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.delegate = self
        return view
    }()
    
//    private lazy var titleLable: UILabel = {
//       let lab = UILabel()
//        lab.textAlignment = .left
//        lab.font = UIFont.pingFangSCMedium(ofSize: 15)
//        lab.textColor = UIColor(hex: "#000000", alpha: 0.9)
//        lab.text = "条件筛选"
//        return lab
//    }()
//    
//    private lazy var closeButton: UIButton = {
//        let button = UIButton(type: .custom)
//        button.setImage(UIImage(named: "zj_close"), for: .normal)
//        button.addTarget(self, action: #selector(dissMissAction), for: .touchUpInside)
//        return button
//    }()
//        
//    private lazy var contentBgView: UIStackView = {
//        let view = UIStackView()
//        view.backgroundColor = UIColor.white
//        view.axis = .vertical
//        view.distribution = .equalSpacing
//        view.alignment = .center
//        view.spacing = 24
//        return view
//    }()
//    
//    private lazy var selectBgView: UIStackView = {
//        let view = UIStackView()
//        view.backgroundColor = UIColor.white
//        view.axis = .horizontal
//        view.distribution = .equalSpacing
//        view.alignment = .center
//        view.spacing = 24
//        return view
//    }()
//    
//    private lazy var contentSubView1 = {
//       let view = UIView()
//        let lab = UILabel()
//        lab.font = UIFont.pingFangSC(ofSize: 16)
//        lab.text = "有空位"
//        lab.textAlignment = .left
//        view.addSubview(lab)
//        view.addSubview(switchView)
//        
//        return view
//    }()
//    
//    private lazy var switchView = {
//       let view = UISwitch()
//        view.onTintColor = UIColor(hex: "#FF528D")
//        view.addTarget(self, action: #selector(switchAction), for: .valueChanged)
//        return view
//    }()
//    
//    private func setupContentView() {
//        let bg1 = UIView()
//        
//    }
//    
//    @objc func switchAction() {
//        
//    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .custom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#000000", alpha: 0.4)
        self.view.addSubview(bgView)
        let bottom = self.view.safeAreaInsets.bottom
        bgView.frame = CGRect(x: 0, y: self.view.bounds.maxY, width: self.view.frame.width, height: 428 + bottom)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        var frame = self.bgView.frame
        let y = self.view.bounds.height - frame.height
        frame.origin.y = y
        UIView.animate(withDuration: 0.3) {
            self.bgView.frame = frame
        }
    }
    
    @objc private func dissMissAction() {
        var frame = self.bgView.frame
        let y = self.view.bounds.height
        frame.origin.y = y
        UIView.animate(withDuration: 0.3) {
            self.bgView.frame = frame
        } completion: { _ in
            self.dismiss(animated: true)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ZJFilterViewController: ZFilterViewProtocol {
    func clickItem(_ action: FliterAction) {
        switch action {
        case .close:
            self.dissMissAction()
        case .cancle:
            self.dissMissAction()
        case .sure:
            self.dissMissAction()
        case .mytreat:
            break
        case .girlFree:
            break
        case .AA:
            break
        case .man:
            break
        case .girl:
            break
        case .noLimit:
            break
        case .seatAvailbale:
            break
        case .none:
            break
        }
    }
    
    
}
