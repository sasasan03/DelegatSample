//
//  AddViewController.swift
//  DelegateSample
//
//  Created by sako0602 on 2023/08/04.
//

import UIKit

//MARK: 🍹このVCで大事なこと1️⃣デリゲートを記述する。2️⃣デリゲートがデータを受け取る処理を書く。

//MARK: 🍔１　ViewControllerのLabelに反映させるために使用するプロトコル。ここが難しかった。メソッド？プロパティ？どっち書けばええの？
//このプロトコルを使って振る舞いを決める。（今回はこのデリゲートを使用してLabelの上書きを行いたい）
protocol TextLabelInput {
    func addSave(item: String)
}

class AddViewController: UIViewController {
    
    //MARK: 🍔２　処理を移譲する側のdelegateを記述
    var delegate: TextLabelInput?
    
    @IBOutlet weak var addTextField: UITextField!
    
    @IBAction func save(_ sender: Any) {
        guard let addTextField = addTextField.text else { return }
        //MARK: 🍔３　delegateを使ってtextFiledからデータをとってくる。ここのデータをプロトコルに適合されたViewへ渡す。
        delegate?.addSave(item: addTextField)
        dismiss(animated: true)
    }
}
