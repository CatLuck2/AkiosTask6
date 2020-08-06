//
//  ViewController.swift
//  AkiosTask6
//
//  Created by Nekokichi on 2020/08/06.
//  Copyright © 2020 Nekokichi. All rights reserved.
//
/*
 1~100の数字を出す（ifで０なら再度出す、%を用いて値に+1をする）
 ボタン押下でアラートを出す
 アラート終了後に乱数を出す
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var themeValue: UILabel!
    @IBOutlet weak var slider: UISlider!
    private var randomValue:Int!
    private let alertTitle = "課題6"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.maximumValue = 100
        slider.minimumValue = 1
        resetAllValue()
    }

    @IBAction func checkResult(_ sender: Any) {
        if Int(slider.value) == randomValue {
            resultAlert(title: alertTitle, message: "当たり!\nあなたの値: \(Int(slider.value))")
        } else {
            resultAlert(title: alertTitle, message: "ハズレ!\nあなたの値: \(Int(slider.value))")
        }
    }
    
    //Sliderと乱数を初期化
    func resetAllValue() {
        slider.value = 50
        //範囲1~100（0~99 + 1）の乱数を出力
        randomValue = Int(arc4random_uniform(100)) + 1
        themeValue.text = "\(self.randomValue ?? 50)"
    }
    
    //ボタン押下後のアラート
    func resultAlert(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "再挑戦", style: .cancel, handler: { (action) in
            self.resetAllValue()
        }))
        present(alert, animated: true, completion: nil)
    }
    
}

