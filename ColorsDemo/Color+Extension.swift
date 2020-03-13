import UIKit

extension UIColor {
    convenience init? (hexString: String) {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.punctuationCharacters)
        let filteredStr = hexString.filter{"aAbBcCdDeEfF0123456789".contains($0)}
        
        guard hexString.count == filteredStr.count, hexString.count == 6 else {
            return nil
        }
        
        let positionR = hexString.index(hexString.startIndex, offsetBy: 2)
        let positionG = hexString.index(hexString.startIndex, offsetBy: 4)
        
        guard let r = Double("0x" + hexString[..<positionR]),
            let g = Double("0x" + hexString[positionR..<positionG]),
            let b = Double("0x" + hexString[positionG...]) else { return nil }
        
        self.init(red:   CGFloat(r / 255),
                  green: CGFloat(g / 255),
                  blue:  CGFloat(b / 255),
                  alpha: 1)
    }
}
