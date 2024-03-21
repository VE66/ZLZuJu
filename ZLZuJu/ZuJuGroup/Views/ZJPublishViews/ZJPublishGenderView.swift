//
//  ZJPublishGenderView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/10.
//

import UIKit

class ZJPublishGenderView: UIView {
    
    private func setButtonData(_ button: UIButton) {
        button.setBackgroundImage(UIColor(hex: "#F7F7F7").toImage(), for: .normal)
        button.setBackgroundImage(UIColor(hex: "#FF528D").toImage(), for: .selected)
        button.setTitleColor(UIColor.white, for: .selected)
        button.setTitleColor(UIColor(hex: "#2D282A"), for: .normal)
        button.clipsToBounds = true
    }
    
    @IBOutlet weak var noLimitButton: UIButton! {
        didSet {
            setButtonData(noLimitButton)
        }
    }
    
    @IBOutlet weak var manButton: UIButton! {
        didSet {
            setButtonData(manButton)
        }
    }
    
    @IBOutlet weak var girlButton: UIButton! {
        didSet {
            setButtonData(girlButton)
        }
    }
    
    @IBOutlet weak var ageLabel: UILabel!
    
    private var selectedGender: UIButton? {
        didSet {
            oldValue?.isSelected = false
            selectedGender?.isSelected = true
        }
    }
    
    @IBOutlet weak var sliderBgView: UIView! {
        didSet {
            setupSliderView()
        }
    }
    
    private var linearSlider: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = color_888888
        return view
    }()
    private var sectionLine: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "zj_age_line")
        return view
    }()
    private lazy var beginTip: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "zj_pan_ellipse")
        view.isUserInteractionEnabled = true
        let pan = UIPanGestureRecognizer(target: self, action: #selector(beginTipPanAction(_:)))
        view.addGestureRecognizer(pan)
        return view
    }()
    private lazy var endTip: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "zj_pan_ellipse")
        view.isUserInteractionEnabled = true
        let pan = UIPanGestureRecognizer(target: self, action: #selector(endTipPanAction(_:)))
        view.addGestureRecognizer(pan)
        return view
    }()
    
    private var beginTipOffX: CGFloat = 0
    private var endTipOffX: CGFloat = 0
    
    private var currentBeginTipOffX: CGFloat = 0
    private var currentEndTipOffX: CGFloat = 0
    
    private let leftMargin: CGFloat = 0

    private var didSetupConstraints = false
    
    @IBAction func beginTipPanAction(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            beginTipOffX = currentBeginTipOffX
        case .changed:
            let changed = sender.translation(in: sliderBgView).x
            var value = changed + beginTipOffX
            if value <= 0 {
                value = 0
            }
            if value + 20 < currentEndTipOffX {
                currentBeginTipOffX = value
                beginTip.snp.updateConstraints { make in
                    make.left.equalTo(value)
                }
            }

        default:
            break
        }
    }
    
    @IBAction func endTipPanAction(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .began:
            endTipOffX = currentEndTipOffX
        case .changed:
            let changed = sender.translation(in: sliderBgView).x
            var value = changed + endTipOffX + 10
            if value >= sliderBgView.frame.width - 20 {
                value = sliderBgView.frame.width - 20
            }
            
            if value > currentBeginTipOffX + 20 {
                currentEndTipOffX = value
                endTip.snp.updateConstraints { make in
                    make.left.equalTo(value)
                }
            }
            

        default:
            break
        }
    }
    
    
    @IBAction func nolimitAction(_ sender: UIButton) {
        selectedGender = sender
    }
    
    @IBAction func manAAction(_ sender: UIButton) {
        selectedGender = sender
    }
    
    @IBAction func girlAction(_ sender: UIButton) {
        selectedGender = sender
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupSliderView() {
        sliderBgView.addSubview(linearSlider)
        sliderBgView.addSubview(sectionLine)
        sliderBgView.addSubview(beginTip)
        sliderBgView.addSubview(endTip)
        currentBeginTipOffX = 0
        currentEndTipOffX = 60
        linearSlider.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(3)
            make.bottom.equalToSuperview().offset(-11)
        }
        beginTip.snp.makeConstraints { make in
            make.left.equalTo(currentBeginTipOffX)
            make.centerY.equalTo(linearSlider)
            make.height.width.equalTo(20)
        }
        endTip.snp.makeConstraints { make in
            make.left.equalTo(currentEndTipOffX)
            make.centerY.equalTo(linearSlider)
            make.height.width.equalTo(20)
        }
        sectionLine.snp.makeConstraints { make in
            make.left.equalTo(beginTip.snp.centerX)
            make.right.equalTo(endTip.snp.centerX)
            make.centerY.equalTo(linearSlider)
            make.height.equalTo(linearSlider)
        }
        
    }
    
    func setupConstraints() {
        beginTip.frame = CGRect(x: leftMargin, y: linearSlider.center.y - 10, width: 20, height: 20)
        endTip.frame = CGRect(x: leftMargin + 100, y: linearSlider.center.y - 10, width: 20, height: 20)
        sectionLine.frame = CGRect(x: beginTip.frame.midX, y: linearSlider.frame.origin.y, width: endTip.frame.midX - beginTip.frame.midX, height: linearSlider.frame.height)
//        beginTip.snp.remakeConstraints { make in
//            make.left.equalTo(leftMargin)
//            make.left.greaterThanOrEqualTo(leftMargin)
//            make.centerY.height.equalTo(linearSlider)
//            make.width.height.equalTo(20)
//        }
//        endTip.snp.remakeConstraints { make in
//            make.right.lessThanOrEqualTo(linearSlider)
//            make.centerY.height.equalTo(linearSlider)
//            make.left.greaterThanOrEqualTo(beginTip.snp.right)
//            make.left.equalTo(leftMargin + 20)
//            make.width.height.equalTo(20)
//        }
//        
        sectionLine.snp.remakeConstraints { make in
            make.leading.equalTo(beginTip)
            make.right.equalTo(endTip)
            make.height.centerY.equalTo(linearSlider)
        }
    }
    
    @IBAction func selectAgeAction(_ sender: Any) {
    }
    
    @IBAction func authentication(_ sender: Any) {
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
