//
//  ZJSiginController.swift
//  SheJiaoQuan
//
//  Created by ZCZ on 2024/3/16.
//

import UIKit

class ZJSiginController: UIViewController {
    
    lazy var titleBgView = {
       let view = UIView()
        return view
    }()

    lazy var line1 = {
       let view = UIView()
        view.backgroundColor = color_EEEEEE
        return view
    }()
    
    lazy var addressBgView = {
        let view = UIView()
         return view
    }()
    
    lazy var line2 = {
       let view = UIView()
        view.backgroundColor = color_EEEEEE
        return view
    }()
    
    lazy var signButton = {
        let btn = UIButton(type: .custom)
        btn.layer.cornerRadius = 135/2.0
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func setSignButtonColor(_ state: Int) {
        if state == 0 {
            signButton.setBackgroundImage(color_FF6D9F.toImage(), for: .normal)
        } else if state == 1 {
            signButton.setBackgroundImage(color_34C900.toImage(), for: .normal)
        } else if state == 2 {
            signButton.setBackgroundImage(color_468AFF.toImage(), for: .normal)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
