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

public class CoolSwitchControls: UIView {
    
    public weak var dataSource:CoolSwitchControlsDataSource?
    public var selected:Int = 0
    public var cornerRadius:CGFloat = 15
    public var knobCornerRadius:CGFloat = 15
    private var parent:UIViewController?
    
    public init(parent:UIViewController) {
        super.init(frame: .zero)
        self.parent = parent
        self.initPage()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initPage(){
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension CoolSwitchControls{
    ///Adding the correct switch type as a subview
    ///and initializing it
    /// - Warning: you should not call this function unless CoolSwitchControls was initialized
    public func CreateSwitch(){
        self.CornerRadius(for: self.cornerRadius)
        ///remove all the subviews if any exist
        for views in self.subviews{
            views.removeFromSuperview()
        }
        
        do{
            try addsubivews()
        }catch let error as SwitchError{
            switch error {
            case .typeError:
                print(SwitchError.typeError.localizedDescription)
            case .configError:
                print(SwitchError.configError.localizedDescription)
            case .parentError:
                print(SwitchError.parentError.localizedDescription)
            }
        }catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    fileprivate func addsubivews()throws{
        guard let type = dataSource?.SetSwitch(for: self).type else {throw SwitchError.typeError}
        guard let configuration = dataSource?.SetSwitch(for: self).config else {throw SwitchError.configError}
        guard let parent = self.parent else {throw SwitchError.parentError}
        
        switch type {
        case .One:
            let view = One(frame: self.bounds, configuration: configuration)
            view.selected = self.selected
            view.cornerRadius = self.knobCornerRadius
            view.delegate = parent as? CoolSwitchControlsDelegate
            self.addSubview(view)
            view.addsubviews()
        case .Two:
            let view = Two(frame: self.bounds, configuration: configuration)
            view.selected = self.selected
            view.cornerRadius = self.knobCornerRadius
            view.delegate = parent as? CoolSwitchControlsDelegate
            self.addSubview(view)
            view.addsubviews()
        case .Three:
            let view = Three(frame: self.bounds, configuration: configuration)
            view.selected = self.selected
            view.cornerRadius = self.knobCornerRadius
            view.delegate = parent as? CoolSwitchControlsDelegate
            self.addSubview(view)
            view.addsubviews()
        }
    }
    
}


private enum SwitchError: Error {
    case typeError
    case configError
    case parentError
    
    var localizedDescription: String {
        switch self {
        case .typeError:
            return NSLocalizedString("No type was found", comment: "")
        case .configError:
            return NSLocalizedString("No config was set", comment: "")
        case .parentError:
            return NSLocalizedString("No parent was set", comment: "")
    }
  }
}
