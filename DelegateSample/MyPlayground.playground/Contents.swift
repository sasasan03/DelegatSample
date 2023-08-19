import UIKit
//デリゲートを使っているクラス (デリゲートの役割を持つクラス):AddViewControllerSample
//プロトコルのメソッドを使うことで、何らかの処理を委譲しています。具体的には、save メソッド内で delegate?.saveFruit(fruit: apple) のように、デリゲートを通して saveFruit メソッドを呼び出しています
//デリゲートが使われているクラス (デリゲートの具体的な実装を持つクラス):ViewControllerSample
//AddViewControllerDelegate プロトコルに従い、そのメソッドを具体的に実装しています。具体的には、saveFruit(fruit: String) メソッドがこのクラス内で定義され、実際の動作が記述されています。


protocol AddViewControllerDelegate: AnyObject {
    func saveFruit(fruit: String)
}

class AddViewControllerSample {//委譲する側
    
    var apple = "りんご" //（仮）ユーザー入力項目
    weak var delegate: AddViewControllerDelegate?
    func save(){
        //デリゲートのメソッドを呼ぶ。（delegateがnilでない場合は、メソッドが実行される。）
        delegate?.saveFruit(fruit: apple)
    }
    
}

class ViewControllerSample: AddViewControllerDelegate { //委譲される側
    
    var fruitName: [String] = []
    
    func saveFruit(fruit: String) {
        fruitName.append(fruit)
        print(fruitName)
    }
    
}

let viewControllerSample = ViewControllerSample()
let addViewControllerSample = AddViewControllerSample()
//デリゲートを設定する。
addViewControllerSample.delegate = viewControllerSample
//saveItemを呼び出す。
addViewControllerSample.save()//["りんご"]


