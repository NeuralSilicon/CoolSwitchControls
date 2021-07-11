// MIT License
//
// Copyright (c) 2021 Ian Cooper
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import UIKit

public enum Type:Int{
    case One = 1
    case Two = 2
    case Three = 3
}

public struct Configuration{
    
    ///label
    public var firstTxt:String = ""
    public var secondTxt:String = ""
    public var font:UIFont.AppleFont = .Bold
    public var fontSize:CGFloat = 18
    public var firstTxtColor:UIColor = .white
    public var secondTxtColor:UIColor = .black
    
    ///background
    public var firstColor:UIColor = .black
    public var secondColor:UIColor = .white
    
    ///off gradientcolor
    public var firstOffColor:UIColor = UIColor.systemGray4
    public var secondOffColor:UIColor = UIColor.systemGray5
    
    ///knob
    public var knobColor:UIColor = .white
    
    ///image
    public var firstImg:UIImage = UIImage()
    public var secondImg:UIImage = UIImage()
    public var firstTintColor:UIColor = .white
    public var secondTintColor:UIColor = .white
    
    public init(){}
    
    /// initializer for switch configuration, configuration has default values. Certain configuration is not needed for different switch types. For example, only type three has gradient colors
    /// - Parameter firstTxt: left text
    /// - Parameter secondTxt: right text
    /// - Parameter font: font for both labels
    /// - Parameter fontSize: font size for labels
    /// - Parameter firstTxtColor: left label text color
    /// - Parameter secondTxtColor: right label text color
    /// - Parameter firstColor: turned off background color
    /// - Parameter secondColor: turned on background color
    /// - Parameter knobColor: knob color for type three switch
    /// - Parameter firstOffColor: gradient left side first off color
    /// - Parameter secondOffColor: gradient right side second off color
    /// - Parameter firstImg: left side image
    /// - Parameter secondImg: right side image
    /// - Parameter firstTintColor: left side image tint color
    /// - Parameter secondTintColor: right side image tint color
    public init(firstTxt:String = "0", secondTxt:String = "1",
                font:UIFont.AppleFont = .Bold, fontSize:CGFloat = 18,
                firstTxtColor:UIColor = .white, secondTxtColor:UIColor = .black,
                firstColor:UIColor = .black, secondColor:UIColor = .white,
                knobColor:UIColor = .white,
                firstOffColor:UIColor = UIColor.systemGray4, secondOffColor:UIColor = UIColor.systemGray5,
                firstImg:UIImage = UIImage(), secondImg:UIImage = UIImage(),
                firstTintColor:UIColor = .white, secondTintColor:UIColor = .white
    ){
        
        self.firstTxt = firstTxt ;self.secondTxt = secondTxt
        self.font = font; self.fontSize = fontSize
        self.firstTxtColor = firstTxtColor; self.secondTxtColor = secondTxtColor
        self.firstColor = firstColor; self.secondColor = secondColor
        self.knobColor = knobColor
        self.firstOffColor = firstOffColor; self.secondOffColor = secondOffColor
        self.firstImg = firstImg; self.secondImg = secondImg
        self.firstTintColor = firstTintColor; self.secondTintColor = secondTintColor
    }

}

extension UIResponder {
    public var parentViewController: UIViewController? {
        return next as? UIViewController ?? next?.parentViewController
    }
}

extension UIView{
    func CornerRadius(for radius:CGFloat){
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
    }
}

// MARK: - Font
extension UIFont {

    public enum AppleFont: String {
        case Bold = "AppleSDGothicNeo-Bold"
        case Light = "AppleSDGothicNeo-Light"
        case Medium = "AppleSDGothicNeo-Medium"
        case Regular = "AppleSDGothicNeo-Regular"
        case SemiBold = "AppleSDGothicNeo_SemiBold"
        case Thin = "AppleSDGothicNeo-Thin"
        case UltraLight = "AppleSDGothicNeo-UltraLight"
    }

    static func customFont(type: AppleFont = .Regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "\(type.rawValue)", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

extension UILabel{
    public func setFont(text:String, font:UIFont.AppleFont, size:CGFloat){
        self.text = text
        self.font = UIFont.customFont(type: font, size: size)
    }
    
    public func setLabel(){
        self.backgroundColor = .clear
        self.numberOfLines = 0
        self.lineBreakMode = .byTruncatingTail
        self.textAlignment = .center
        self.adjustsFontSizeToFitWidth = true
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIStackView{
    public func setStack(){
        self.alignment = .center
        self.distribution = .fillEqually
        self.axis = .horizontal
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

// MARK: -Image
extension UIImage {
    func Resize(targetSize: CGSize) -> UIImage {
         return UIGraphicsImageRenderer(size:targetSize).image { _ in
             self.draw(in: CGRect(origin: .zero, size: targetSize))
         }
     }
}
