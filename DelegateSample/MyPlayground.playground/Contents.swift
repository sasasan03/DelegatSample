import UIKit

enum GogoichiKind: String {

    case Butaman = "豚まん"
    case Dango = "団子"
    case Gyoza = "餃子"
}

class Gogoichi {

    var price: Int {

        switch kind {
        case .Butaman:
            return 170
        case .Dango:
            return 30
        case .Gyoza:
            return 30
        }
    }

    var kind: GogoichiKind = .Butaman
}

protocol SendGogoichi {

    func send(gogoichi: Gogoichi) -> Void
}

class Amazon: SendGogoichi {


    func send(gogoichi: Gogoichi) {

        //
        for _ in 0...2 {
            sleep(1)
            print("配達中...")
        }
        print("\(gogoichi.kind)の送信を完了しました.値段は\(gogoichi.price)円です.")

    }
}

class ButamanPersonInTokyo {

    var delegate: SendGogoichi?

    func orderButaman() {

        let gogoichi: Gogoichi = Gogoichi()
        gogoichi.kind = .Butaman
        delegate?.send(gogoichi: gogoichi)
    }
}

class OsakaFriend: SendGogoichi {

    func send(gogoichi: Gogoichi) {

        for _ in 0...2 {
            sleep(1)
            print("配達中...")
        }
        print("\(gogoichi.kind)の送信を完了しました.値段は友達なので無料だよ.")
    }
}
let osakaFriends = OsakaFriend()

let butamanPerson = ButamanPersonInTokyo()

butamanPerson.delegate = osakaFriends

butamanPerson.orderButaman()


