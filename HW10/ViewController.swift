//
//  ViewController.swift
//  HW10
//
//  Created by Максим Громов on 28.07.2024.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    lazy var stack = UIStackView()
    lazy var textField = UITextField()
    lazy var label = UILabel()
    lazy var objectStack = UIStackView()
    lazy var objectLabel = UILabel()
    lazy var objectTF1 = UITextField()
    lazy var objectTF2 = UITextField()
    lazy var objectSwitcher = UISwitch()
    lazy var button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        objectStack.addArrangedSubview(objectLabel)
        objectStack.addArrangedSubview(objectTF1)
        objectStack.addArrangedSubview(objectTF2)
        objectStack.addArrangedSubview(objectSwitcher)
        objectStack.axis = .vertical
        objectStack.spacing = 20
        
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(textField)
        stack.addArrangedSubview(objectStack)
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            make.width.equalToSuperview().inset(50)
        }
        
        
        label.text = "Введите строку"
        objectLabel.text = "Введите параметры объекта"
        textField.borderStyle = .roundedRect
        textField.placeholder = "Строка"
        objectTF1.borderStyle = .roundedRect
        objectTF1.placeholder = "Строка"
        objectTF2.borderStyle = .roundedRect
        objectTF2.placeholder = "Число"
        objectTF2.keyboardType = .numberPad
        
        button.setTitle("Далее", for: .normal)
        button.setTitleColor(.cyan, for: .normal)
        stack.addArrangedSubview(button)
        button.addTarget(self, action: #selector(goForward), for: .touchUpInside)
    }
    
    @objc func goForward(){
        let controller = SecondViewController()
        guard let name = objectTF1.text else { return }
        guard let text = textField.text else { return }
        guard let ageText = objectTF2.text else { return }
        guard let age = Int(ageText) else { return }
        controller.object = SomeObject(name: name, age: age, bool: objectSwitcher.isOn)
        controller.text = text
        controller.step = 1
        present(controller, animated: true)
    }
    
    

}

