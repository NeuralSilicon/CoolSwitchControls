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

class Three:Switches {
        
    init(frame:CGRect, configuration:Configuration) {
        super.init(frame: frame)
        self.configuration = configuration
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addsubviews(){
        super.addsubviews()
        
        let size = self.frame.size
        
        for i in 0...1{
            let label = UILabel()
            label.frame = CGRect(x: CGFloat(i)*size.width / 2, y: 0, width: size.width / 2, height: size.height)
            label.setFont(text: [configuration.firstTxt, configuration.secondTxt][i], font: configuration.font, size: configuration.fontSize)
            label.textColor = [configuration.firstColor, configuration.secondColor][i]
            label.setLabel()
            label.tag = i
            
            labels.append(label)
            stackView.addArrangedSubview(label)
            NSLayoutConstraint.activate([
                label.widthAnchor.constraint(equalToConstant: size.width / 2),
                label.heightAnchor.constraint(equalToConstant: size.height)
            ])
            
        }

        grediantColor = CAGradientLayer()
        grediantColor.startPoint = CGPoint(x: 0.0, y: 0.5)
        grediantColor.endPoint = CGPoint(x: 1.0, y: 0.5)
        grediantColor.frame = self.bounds
        grediantColor.colors = [configuration.firstColor.cgColor, configuration.secondColor.cgColor]
        self.layer.insertSublayer(grediantColor, at: 0)
        
        knob = UIView()
        knob.frame.size.width = size.height - 10
        knob.frame.size.height = size.height - 10
        knob.frame.origin.x = 5
        knob.frame.origin.y = 5
        knob.CornerRadius(for: self.cornerRadius)
        knob.backgroundColor = configuration.knobColor
        knob.layer.masksToBounds = false

        knob.layer.shadowColor = UIColor.black.cgColor
        knob.layer.shadowOffset = .zero
        knob.layer.shadowRadius = 3
        knob.layer.shadowOpacity = 0.14
        knob.layer.shadowPath = UIBezierPath(roundedRect: knob.bounds, cornerRadius: knob.layer.cornerRadius).cgPath
        
        knobimg = UIImageView()
        knobimg.frame.size.width = knob.frame.width - 15
        knobimg.frame.size.height = knob.frame.height - 15
        knobimg.frame.origin.x = 7.5
        knobimg.frame.origin.y = 7.5
        knobimg.contentMode = .center
        knobimg.backgroundColor = .clear
        knob.addSubview(knobimg)

        self.insertSubview(knob, belowSubview: stackView)
        self.InitializeSelection()
    }
    
    
    override func InitializeSelection(){
        switch self.selected {
        case 0:
            self.labels.last?.textColor = .clear
            self.knob.center.x = labels.first?.center.x ?? 0
            labels.first?.textColor = self.configuration.firstTxtColor
            
            DispatchQueue.main.async {
                self.grediantColor.colors = [UIColor.systemGray4.cgColor, UIColor.systemGray5.cgColor]
                self.knobimg.image = self.configuration.firstImg.withRenderingMode(.alwaysTemplate)
                self.knobimg.tintColor = self.configuration.firstTintColor
            }
        case 1:
            self.labels.first?.textColor = .clear
            self.knob.center.x = labels.last?.center.x ?? 0
            labels.last?.textColor = self.configuration.secondTxtColor
            
            DispatchQueue.main.async {
                self.grediantColor.colors = [self.configuration.firstColor.cgColor, self.configuration.secondColor.cgColor]
                self.knobimg.image = self.configuration.secondImg.withRenderingMode(.alwaysTemplate)
                self.knobimg.tintColor = self.configuration.secondTintColor
            }
        default:
            break
        }
    }
    
    @objc override func UpdateView(){
        super.UpdateView()
        
        let sender = labels[self.selected]

        switch self.selected {
        case 0: ///going from On to Off
            DispatchQueue.main.async {
                self.grediantColor.colors = [UIColor.systemGray4.cgColor, UIColor.systemGray5.cgColor]
                self.knobimg.image = self.configuration.firstImg.withRenderingMode(.alwaysTemplate)
                self.knobimg.tintColor = self.configuration.firstTintColor
            }
            
            UIView.animate(withDuration: 0.7,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .beginFromCurrentState,
                           animations: {
                
                            self.labels.last?.textColor = .clear
                            self.knob.center.x = sender.center.x
                            sender.textColor = self.configuration.firstTxtColor
                
                        })
        case 1: ///going from Off to On
            DispatchQueue.main.async {
                self.grediantColor.colors = [self.configuration.firstColor.cgColor, self.configuration.secondColor.cgColor]
                self.knobimg.image = self.configuration.secondImg.withRenderingMode(.alwaysTemplate)
                self.knobimg.tintColor = self.configuration.secondTintColor
            }
            
            UIView.animate(withDuration: 0.7,
                           delay: 0,
                           usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0,
                           options: .beginFromCurrentState,
                           animations: {
                            

                    
                            self.labels.first?.textColor = .clear
                            self.knob.center.x = sender.center.x
                            sender.textColor = self.configuration.secondTxtColor
                
                           })
        default:
            break
        }
        
    }
    
    
}
