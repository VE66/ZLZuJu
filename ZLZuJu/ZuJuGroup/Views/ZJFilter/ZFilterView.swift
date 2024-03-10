//
//  ZJFilterView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/9.
//

import UIKit

enum FliterAction {
case close, // 关闭
     sure, // 确定
     cancle, // 取消
     seatAvailbale, // 有位置
     mytreat, // 我请客
     girlFree, // 男A女免单
     AA, // AA
     man,
     girl,
     noLimit,
     none
}

protocol ZFilterViewProtocol: AnyObject {
    func clickItem(_ action: FliterAction)
}

class ZFilterView: UIView {
    
    @IBOutlet weak var myTreatButton: UIButton!
    @IBOutlet weak var girlFreeButton: UIButton!
    @IBOutlet weak var AAButton: UIButton!
    
    
    @IBOutlet weak var manButton: UIButton!
    @IBOutlet weak var girlButton: UIButton!
    @IBOutlet weak var noLimitButton: UIButton!
    
    private var dateTheme: FliterAction = .none {
        didSet {
            if dateTheme != oldValue {
                setDate(newTheme: dateTheme, oldTheme: oldValue)
            }
        }
    }
    
    private func setDate(newTheme: FliterAction, oldTheme: FliterAction) {
        let setButton: UIButton? = getCurrentButton(action: newTheme)
        setButton?.isSelected = true
        setButton?.layer.borderColor = setButton?.tintColor.cgColor
        setButton?.layer.borderWidth = 1
        setButton?.backgroundColor = UIColor.white
        
        let oldButton: UIButton? = getCurrentButton(action: oldTheme)
        oldButton?.isSelected = false
        oldButton?.layer.borderWidth = 0
        oldButton?.backgroundColor = UIColor(hex: "#F7F7F7")

        func getCurrentButton(action: FliterAction) -> UIButton? {
            var button: UIButton?
            switch action {
            case .mytreat:
                button = myTreatButton
            case .girlFree:
                button = girlFreeButton
            case .AA:
                button = AAButton
            case .man:
                button = manButton
            case .girl:
                button = girlButton
            case .noLimit:
                button = noLimitButton
            default:
                break
            }
            return button
        }

    }
    
    
    private var gender: FliterAction = .none {
        didSet {
            if gender != oldValue {
                setDate(newTheme: gender, oldTheme: oldValue)
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    weak var delegate: ZFilterViewProtocol?
    

    @IBAction func closeAction(_ sender: Any) {
        delegate?.clickItem(.close)
    }
    
    @IBAction func switchAction(_ sender: Any) {
        delegate?.clickItem(.seatAvailbale)
    }
    
    @IBAction func IPayforIt(_ sender: Any) {
        dateTheme = .mytreat
        delegate?.clickItem(.mytreat)
    }
    
    @IBAction func manPay(_ sender: Any) {
        dateTheme = .girlFree
        delegate?.clickItem(.girlFree)
    }
    
    @IBAction func AAPay(_ sender: Any) {
        dateTheme = .AA
        delegate?.clickItem(.AA)
    }
    
    @IBAction func selectMan(_ sender: Any) {
        gender = .man
        delegate?.clickItem(.man)
    }
    
    @IBAction func selectGirl(_ sender: Any) {
        gender = .girl
        delegate?.clickItem(.girl)
    }
    
    @IBAction func selectNone(_ sender: Any) {
        gender = .noLimit
        delegate?.clickItem(.noLimit)
    }
    
    @IBAction func cancleAction(_ sender: Any) {
        delegate?.clickItem(.cancle)
    }
    
    @IBAction func sureAction(_ sender: Any) {
        delegate?.clickItem(.sure)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
