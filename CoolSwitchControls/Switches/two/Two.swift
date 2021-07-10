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

class Two:Switches {

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

        leftKnob = UIView()
        leftKnob.frame.size.width = (size.width/2) + 15
        leftKnob.frame.size.height = size.height - 10
        leftKnob.frame.origin.x = 5
        leftKnob.frame.origin.y = 5
        leftKnob.CornerRadius(for: self.cornerRadius)
        leftKnob.backgroundColor = configuration.firstColor
        leftKnob.layer.masksToBounds = false
        
        leftKnob.layer.shadowColor = UIColor.black.cgColor
        leftKnob.layer.shadowOffset = .zero
        leftKnob.layer.shadowRadius = 3
        leftKnob.layer.shadowOpacity = 0.14
        leftKnob.layer.shadowPath = UIBezierPath(roundedRect: leftKnob.bounds, cornerRadius: leftKnob.layer.cornerRadius).cgPath
        
        leftKnobimg = UIImageView()
        leftKnobimg.frame.size.width = leftKnob.frame.width - 15
        leftKnobimg.frame.size.height = leftKnob.frame.height - 15
        leftKnobimg.frame.origin.x = 15
        leftKnobimg.frame.origin.y = 7.5
        leftKnobimg.contentMode = .center
        leftKnobimg.backgroundColor = .clear
        leftKnob.addSubview(leftKnobimg)
        
        rightKnob = UIView()
        rightKnob.frame.size.width = (size.width/2) + 15
        rightKnob.frame.size.height = size.height - 10
        rightKnob.frame.origin.x = size.width
        rightKnob.frame.origin.y = 5
        rightKnob.CornerRadius(for: self.cornerRadius)
        rightKnob.backgroundColor = configuration.secondColor
        rightKnob.layer.masksToBounds = false
        
        rightKnob.layer.shadowColor = UIColor.black.cgColor
        rightKnob.layer.shadowOffset = .zero
        rightKnob.layer.shadowRadius = 3
        rightKnob.layer.shadowOpacity = 0.14
        rightKnob.layer.shadowPath = UIBezierPath(roundedRect: rightKnob.bounds, cornerRadius: rightKnob.layer.cornerRadius).cgPath
        
        rightKnobimg = UIImageView()
        rightKnobimg.frame.size.width = rightKnob.frame.width - 15
        rightKnobimg.frame.size.height = rightKnob.frame.height - 15
        rightKnobimg.frame.origin.x = 0
        rightKnobimg.frame.origin.y = 7.5
        rightKnobimg.contentMode = .center
        rightKnobimg.backgroundColor = .clear
        rightKnob.addSubview(rightKnobimg)
        
        self.addSubview(leftKnob)
        self.addSubview(rightKnob)
        
        self.insertSubview(leftKnob, belowSubview: stackView)
        self.insertSubview(rightKnob, belowSubview: stackView)
        
        self.InitializeSelection()
    }
    
    
    override func InitializeSelection(){
        switch self.selected {
        case 0:
            self.leftKnob.center.x = (labels.first?.center.x ?? 0) - 15
            self.rightKnob.frame.origin.x = self.frame.width
            
            self.backgroundColor = self.configuration.secondColor
            
            self.labels.last?.textColor = self.configuration.secondTxtColor
            labels[selected].textColor = self.configuration.firstTxtColor
            
            self.leftKnobimg.image = self.configuration.firstImg.withRenderingMode(.alwaysTemplate)
            self.leftKnobimg.tintColor = self.configuration.firstTintColor
        case 1:
            self.backgroundColor = self.configuration.firstColor
            
            self.rightKnob.center.x = (labels.last?.center.x ?? 0) + 15
            self.leftKnob.frame.origin.x = -self.leftKnob.frame.width
            
            self.labels.first?.textColor = self.configuration.firstTxtColor
            labels[selected].textColor = self.configuration.secondTxtColor
            
            self.rightKnobimg.image = self.configuration.secondImg.withRenderingMode(.alwaysTemplate)
            self.rightKnobimg.tintColor = self.configuration.secondTintColor
        default:
            break
        }
    }
    
    
    @objc override func UpdateView(){
        super.UpdateView()
        
        let sender = labels[self.selected]
        
        ///going from Off to On
        switch self.selected {
        case 0:
            UIView.animateKeyframes(withDuration: 0.7, delay: 0, options: .calculationModeCubic, animations: {
                
                
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/2) {
                    self.backgroundColor = self.configuration.secondColor
                    
                    self.labels.last?.textColor = self.configuration.secondTxtColor
                    
                    self.leftKnob.center.x = sender.center.x - 15
                    self.rightKnob.frame.origin.x = self.frame.width
                }
                
                
                UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 1/2) {
                    sender.textColor = self.configuration.firstTxtColor
                    
                    self.leftKnobimg.image = self.configuration.firstImg.withRenderingMode(.alwaysTemplate)
                    self.leftKnobimg.tintColor = self.configuration.firstTintColor
                }
                
            }, completion:  nil)
        case 1:
            UIView.animateKeyframes(withDuration: 0.7, delay: 0, options: .calculationModeCubic, animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1/2) {
                    self.labels.first?.textColor = self.configuration.firstTxtColor
                    
                    self.backgroundColor = self.configuration.firstColor
                    
                    self.rightKnob.center.x = sender.center.x + 15
                    self.leftKnob.frame.origin.x = -self.leftKnob.frame.width
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.50, relativeDuration: 1/2) {
                    sender.textColor = self.configuration.secondTxtColor
                    
                    self.rightKnobimg.image = self.configuration.secondImg.withRenderingMode(.alwaysTemplate)
                    self.rightKnobimg.tintColor = self.configuration.secondTintColor
                }
                
            }, completion: nil)
        default:
            break
        }
    }
    
    
}
