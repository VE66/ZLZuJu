//
//  ZJPublishThemeView.swift
//  ZLZuJu
//
//  Created by ZCZ on 2024/3/10.
//

import UIKit

class ZJPublishThemeView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {

    private let items: [ZJActivityType] = [.eat, .movie, .sing, .sport, .chat, .shopping, .travel, .custom]

    @IBOutlet weak var themeCollection: UICollectionView! {
        didSet {
            themeCollection.register(ZJThemeCollectionCell.self, forCellWithReuseIdentifier: "cell_id")
            
            themeCollection.delegate = self
            themeCollection.dataSource = self
            print("sssssss")
        }
    }
    
    
    @IBOutlet weak var organizerPayButton: UIButton!
   
    @IBOutlet weak var manAGirlFreeButton: UIButton!
    
    @IBOutlet weak var AAButton: UIButton!
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_id", for: indexPath) as! ZJThemeCollectionCell
        let mode = items[indexPath.row]
        cell.setdata(mode, isSelected: false)
        return cell
    }
    
    
    
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

class ZJThemeCollectionCell: UICollectionViewCell {
    
    private let font_normalColor = UIColor(hex: "#2D282A")
    private let font_selectedColor = UIColor.white
    private let bg_normalColor = UIColor(hex: "#F7F7F7")
    private let bg_selectedColor = UIColor(hex: "#FF528D")

    lazy var titelLab = {
       let lab = UILabel()
        lab.textAlignment = .center
        lab.font = UIFont.pingFangSC(ofSize: 14)
        lab.textColor = self.font_normalColor
        return lab
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 4
        self.addSubview(titelLab)
        titelLab.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setdata(_ mode: ZJActivityType, isSelected: Bool) {
        titelLab.text = mode.value
        setSelectedItem(isSelected)
    }
    
    func setSelectedItem(_ isSelected: Bool) {
        if isSelected {
            titelLab.textColor = font_selectedColor
            titelLab.backgroundColor = bg_selectedColor
        } else {
            titelLab.textColor = font_normalColor
            titelLab.backgroundColor = bg_normalColor
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
