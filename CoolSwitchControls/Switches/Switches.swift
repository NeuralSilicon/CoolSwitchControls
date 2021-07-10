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

class Switches: UIView {
    
    var stackView:UIStackView!
    ///type one and three
    var knob:UIView!
    var knobimg:UIImageView!
    
    ///used only for type two
    var rightKnob:UIView!
    var leftKnob:UIView!
    var rightKnobimg:UIImageView!
    var leftKnobimg:UIImageView!
    
    var labels:[UILabel]=[]

    var configuration:Configuration!
    weak var delegate:CoolSwitchControlsDelegate?
    
    var cornerRadius:CGFloat!
    var selected:Int!
    var grediantColor:CAGradientLayer!
    let generator = UIImpactFeedbackGenerator(style: .soft)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///Add subviews to the view
    func addsubviews(){
        self.layer.masksToBounds = true
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(UpdateView)))
        
        stackView = UIStackView()
        stackView.setStack()
        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    ///First initialization of the switch control
    func InitializeSelection(){}
    
    ///Update switch control when tapped which would change the value of selected and pass it to the delegate
    /// ```
    /// print(selected) //left:Off, right:On
    /// ```
    @objc func UpdateView(){
        generator.impactOccurred()

        self.selected = self.selected == 0 ? 1 : 0
        
        guard let view = self.superview else {return}
        delegate?.ValueChanged(for: view, value: self.selected)
    }
}
