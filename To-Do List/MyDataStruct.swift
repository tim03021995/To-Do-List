import Foundation
import UIKit
struct Data {
    var title:String
    var text:String?
    var image:UIImage?
    var bgcolor:UIColor?
}
struct  MaKaLonColor{
    let  blue:UIColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    let purple:UIColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    let pink:UIColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    let orange:UIColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
    let yello:UIColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
    let green:UIColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    func colorRezen() -> UIColor{
        let  num = Int.random(in: 1...6)
        switch num {
        case 1:
            return blue
            case 2:
                return purple
            case 3:
                return pink
            case 4:
                return orange
            case 5:
                return yello
            case 6:
                return green
        default:
            return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

var myTask = [Data]()
var color = MaKaLonColor()
public var reRow:Int?
