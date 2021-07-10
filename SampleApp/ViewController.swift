
import UIKit
import CoolSwitchControls

class ViewController: UIViewController {

    var coolSwitchControls:CoolSwitchControls!
    var secondswitch:CoolSwitchControls!
    var thirdSwitch:CoolSwitchControls!
    
    var fourthswitch:CoolSwitchControls!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        addsubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        coolSwitchControls.CreateSwitch()
        secondswitch.CreateSwitch()
        thirdSwitch.CreateSwitch()
        fourthswitch.CreateSwitch()
    }

    func addsubviews(){
        coolSwitchControls = CoolSwitchControls(parent: self)
        coolSwitchControls.dataSource = self
        coolSwitchControls.selected = 0
        coolSwitchControls.cornerRadius = 20
        coolSwitchControls.knobCornerRadius = 15
        self.view.addSubview(coolSwitchControls)
        NSLayoutConstraint.activate([
            coolSwitchControls.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.width*0.6),
            coolSwitchControls.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coolSwitchControls.widthAnchor.constraint(equalToConstant: 80),
            coolSwitchControls.heightAnchor.constraint(equalToConstant: 40)
        ])
        view.layoutIfNeeded()
        
        secondswitch = CoolSwitchControls(parent: self)
        secondswitch.dataSource = self
        secondswitch.selected = 1
        secondswitch.cornerRadius = 20
        secondswitch.knobCornerRadius = 15
        self.view.addSubview(secondswitch)
        NSLayoutConstraint.activate([
            secondswitch.topAnchor.constraint(equalTo: coolSwitchControls.bottomAnchor, constant: 20),
            secondswitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondswitch.widthAnchor.constraint(equalToConstant: 80),
            secondswitch.heightAnchor.constraint(equalToConstant: 40)
        ])
        view.layoutIfNeeded()
        
        thirdSwitch = CoolSwitchControls(parent: self)
        thirdSwitch.dataSource = self
        thirdSwitch.selected = 0
        thirdSwitch.cornerRadius = 20
        thirdSwitch.knobCornerRadius = 15
        self.view.addSubview(thirdSwitch)
        NSLayoutConstraint.activate([
            thirdSwitch.topAnchor.constraint(equalTo: secondswitch.bottomAnchor, constant: 20),
            thirdSwitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdSwitch.widthAnchor.constraint(equalToConstant: 80),
            thirdSwitch.heightAnchor.constraint(equalToConstant: 40)
        ])
        view.layoutIfNeeded()
        
        fourthswitch = CoolSwitchControls(parent: self)
        fourthswitch.dataSource = self
        fourthswitch.selected = 0
        fourthswitch.cornerRadius = 10
        fourthswitch.knobCornerRadius = 10
        self.view.addSubview(fourthswitch)
        NSLayoutConstraint.activate([
            fourthswitch.topAnchor.constraint(equalTo: thirdSwitch.bottomAnchor, constant: 20),
            fourthswitch.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fourthswitch.widthAnchor.constraint(equalToConstant: 80),
            fourthswitch.heightAnchor.constraint(equalToConstant: 40)
        ])
        view.layoutIfNeeded()
    }
}

extension ViewController: CoolSwitchControlsDataSource, CoolSwitchControlsDelegate{
    
    func SetSwitch(for switchControl: UIView) -> SwitchInitialization {
        
        if switchControl == self.coolSwitchControls{
            
            let type:Type = .One
            let config = Configuration(firstTxt:"",secondTxt: "",
                                       firstColor: .systemRed, secondColor: .black,
                                       firstImg: UIImage(systemName: "xmark")!.applyingSymbolConfiguration(.init(pointSize: 15, weight: .bold))!,
                                       secondImg: UIImage(systemName: "checkmark")!.applyingSymbolConfiguration(.init(pointSize: 15, weight: .bold))!,
                                       firstTintColor: .white, secondTintColor: .white)
            
            return SwitchInitialization(type: type, config: config)
        }else if switchControl == self.secondswitch{
            
            let type:Type = .Two
            let configs = Configuration(firstTxt: "", secondTxt: "",
                                        font: .Bold,
                                        firstTxtColor: .white, secondTxtColor: .white,
                                        firstColor: .systemBlue, secondColor: .black,
                                        knobColor: .white,
                                        firstImg: UIImage(systemName: "xmark")!.applyingSymbolConfiguration(.init(pointSize: 15, weight: .bold))!,
                                        secondImg: UIImage(systemName: "checkmark")!.applyingSymbolConfiguration(.init(pointSize: 15, weight: .bold))!,
                                        firstTintColor: .white, secondTintColor: .white)
            
            return SwitchInitialization(type: type, config: configs)
        
        }else if switchControl == self.thirdSwitch{
            
            let type:Type = .Three
            let configs = Configuration(firstTxt: "", secondTxt: "",
                                        font: .Bold,
                                        firstTxtColor: .white, secondTxtColor: .white,
                                        firstColor: .systemGreen, secondColor: .green,
                                        knobColor: .white,
                                        firstImg: UIImage(systemName: "xmark")!.applyingSymbolConfiguration(.init(pointSize: 15, weight: .bold))!,
                                        secondImg: UIImage(systemName: "checkmark")!.applyingSymbolConfiguration(.init(pointSize: 15, weight: .bold))!,
                                        firstTintColor: .black, secondTintColor: .black)
            
            return SwitchInitialization(type: type, config: configs)
        }else if switchControl == self.fourthswitch{
            
            let type:Type = .Three
            let configs = Configuration(firstTxt: "0", secondTxt: "1",
                                        font: .Bold,
                                        firstTxtColor: .black, secondTxtColor: .black,
                                        firstColor: .systemPurple, secondColor: .systemIndigo,
                                        knobColor: .white,
                                        firstOffColor: .systemGray5, secondOffColor: .systemGray3)
            
            return SwitchInitialization(type: type, config: configs)
        }
        
        return SwitchInitialization(type: nil, config: nil)
    }
    
    func ValueChanged(for switchControl: UIView, value: Int) {
        if switchControl == self.coolSwitchControls{
            print("1", value)
        }else if switchControl == self.secondswitch{
            print("2", value)
        }else if switchControl == self.thirdSwitch{
            print("3", value)
        }else{
            print("4", value)
        }
    }

}
