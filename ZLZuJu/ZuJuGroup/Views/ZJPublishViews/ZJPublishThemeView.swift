//
//  ZJPublishThemeView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/10.
//

import UIKit

extension ZJPublishThemeView: DateThemeProtocol {
    func reloadThemeData(_ lists: [ZJDateTheme]) {
        self.lists = lists
    }
    
    
}

class ZJPublishThemeView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

//    private let items: [ZJActivityType] = [.eat, .movie, .sing, .sport, .chat, .shopping, .travel, .custom]
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    private var lists: [ZJDateTheme] = [] {
        didSet {
            self.reloadData()
        }
    }
    
    @IBOutlet weak var themeCollection: UICollectionView! {
        didSet {
            themeCollection.register(ZJThemeCollectionCell.self, forCellWithReuseIdentifier: "cell_id")
            
            themeCollection.delegate = self
            themeCollection.dataSource = self
            ZJDateThemeManager.shared.deleagete = self
        }
    }
    
    func reloadData() {
        themeCollection.reloadData()
        self.layoutIfNeeded()
        let contentSize = themeCollection.contentSize
        collectionViewHeight.constant = contentSize.height
    }
    
    private func setButtonData(_ button: UIButton) {
        button.setBackgroundImage(UIColor(hex: "#F7F7F7").toImage(), for: .normal)
        button.setBackgroundImage(UIColor(hex: "#FF528D").toImage(), for: .selected)
        button.setTitleColor(UIColor.white, for: .selected)
        button.setTitleColor(UIColor(hex: "#2D282A"), for: .normal)
        button.clipsToBounds = true
    }
    
    @IBOutlet weak var organizerPayButton: UIButton! {
        didSet {
            setButtonData(organizerPayButton)
        }
    }
   
    @IBOutlet weak var manAGirlFreeButton: UIButton! {
        didSet {
            setButtonData(manAGirlFreeButton)
        }
    }
    
    @IBOutlet weak var AAButton: UIButton! {
        didSet {
            setButtonData(AAButton)
        }
    }
    

    @IBAction func organizerAction(_ sender: UIButton) {
        currentPayButton = sender
    }
    
    @IBAction func manAGirlFreeAction(_ sender: UIButton) {
        currentPayButton = sender
    }
    
    @IBAction func AAAction(_ sender: UIButton) {
        currentPayButton = sender
    }
    
    private var currentSelect: IndexPath = IndexPath(row: 0, section: 0)
    private var currentPayButton: UIButton? {
        didSet {
            oldValue?.isSelected = false
            currentPayButton?.isSelected = true
            if currentPayButton == manAGirlFreeButton {
                paymentType = .manA
            } else if currentPayButton == AAButton {
                paymentType = .AA
            } else if currentPayButton == organizerPayButton {
                paymentType = .sponsorPays
            }
        }
    }

    var paymentType: ZJPaymentType?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ZJDateThemeManager.shared.lists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as! ZJThemeCollectionCell
        let model = ZJDateThemeManager.shared.lists[indexPath.row]
        
        cell.setdata(model, isSelected: currentSelect == indexPath)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if currentSelect != indexPath {
            let cell = collectionView.cellForItem(at: indexPath) as! ZJThemeCollectionCell
            cell.isSelected = true
            let decell = collectionView.cellForItem(at: currentSelect) as! ZJThemeCollectionCell
            decell.isSelected = false
            currentSelect = indexPath
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let model = ZJDateThemeManager.shared.lists[indexPath.row]
//        let width = ZJThemeCollectionCell.getCellWidth(model.name)
//        return CGSize(width: width, height: 28)
//    }

}


class ZJThemeCollectionCell: UICollectionViewCell {
    
    private let font_normalColor = UIColor(hex: "#2D282A")
    private let font_selectedColor = UIColor.white
    private let bg_normalColor = UIColor(hex: "#F7F7F7")
    private let bg_selectedColor = UIColor(hex: "#FF528D")
    private static let titleFont = UIFont.pingFangSC(ofSize: 14)
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                titelLab.textColor = font_selectedColor
                self.backgroundColor = bg_selectedColor
            } else {
                titelLab.textColor = font_normalColor
                self.backgroundColor = bg_normalColor
            }
        }
    }
    
    weak var model: ZJDateTheme?
    lazy var titelLab = {
       let lab = UILabel()
        lab.textAlignment = .center
        lab.font = Self.titleFont
        lab.textColor = self.font_normalColor
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
        self.addSubview(titelLab)
        titelLab.snp.makeConstraints { make in
            make.top.equalTo(3)
            make.bottom.equalTo(-3)
            make.left.equalToSuperview().offset(9)
            make.right.equalTo(-9)
        }
    }
    
    func setdata(_ model: ZJDateTheme, isSelected: Bool) {
        self.model = model
        titelLab.text = model.name
        self.isSelected = isSelected
    }

    
    static func getCellWidth(_ title: String) -> CGFloat {
        let lab = UILabel()
        lab.font = self.titleFont
        lab.text = title
        lab.sizeToFit()
        return lab.frame.width + 9 + 9
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
