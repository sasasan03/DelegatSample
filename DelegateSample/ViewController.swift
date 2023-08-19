//
//  ViewController.swift
//  DelegateSample
//
//  Created by sako0602 on 2023/08/04.
//

import UIKit

//MARK: 🍹このVCで大事なことは1️⃣プロトコルに適合2️⃣デリゲートを使用することを宣言3️⃣デリゲートが持つメソッドを使用してLabelを上書きしていく。

//MARK: 🍔４　共通のインターフェースをこのViewControllerに持たせ、適合させる。
class ViewController: UIViewController, TextLabelInput {
    
    @IBOutlet weak var textLabel: UILabel!
    //遷移先をまず作る。
    //segueを使用して値の受け渡しを行うためにprepareを使用。
    //遷移する前にデリゲートをセット
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nav = segue.destination as? UINavigationController else { return }
        guard let addVC = nav.topViewController as? AddViewController else { return }
        //MARK: 🍔５　このViewがdelegatを使用することを宣言する。ここ大事。（委譲されることを宣言する）
        //＊ここで宣言しておかないと、addSaveのメソッドが機能しない。
        addVC.delegate = self//AddViewControllerのnilのdelegateにデータを代入する。
    }
    //MARK: 🍔６　デリゲートから受け取ったデータを使用して、Labelを上書きする。（デリゲートの具体的な処理内容）
    //*⭕️デリゲートの設定がない場合。
    //*❌宣言がない場合このメソッドは呼ばれない。宣言（デクラレーション）定義（defini/tion名）
    //宣言・・こういうものがありますよ。どういうものか言ってない。抽象的。
    //定義・・こういうものですよ。具体的。
    func addSave(item: String) {//呼ばれたところ
        textLabel.text = item
    }
}


class SubViewContoroller: TextLabelInput {
    func addSave(item: String) {
        
    }
}

class Sub2ViewController { }
