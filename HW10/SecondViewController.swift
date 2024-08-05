//
//  SecondViewController.swift
//  HW10
//
//  Created by Максим Громов on 28.07.2024.
//

import UIKit
class SomeObject{
    var name: String
    var age: Int
    var bool: Bool
    init(name: String, age: Int, bool: Bool) {
        self.name = name
        self.age = age
        self.bool = bool
    }
}
class SecondViewController: UIViewController {
    var text: String?
    var step: Int?
    var object: SomeObject?
    
    lazy var forward = UIButton()
    lazy var backward = UIButton()
    lazy var stack = UIStackView()
    lazy var mainStack = UIStackView()
    lazy var stepLabel = UILabel()
    lazy var objectLabel = UILabel()
    lazy var textLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        guard let step = step else { return }
        stack.addArrangedSubview(backward)
        stepLabel.text = "\(step)"
        stack.addArrangedSubview(stepLabel)
        if step != 5{
            stack.addArrangedSubview(forward)
        }
        
        
        stack.spacing = 40
        forward.setTitle("Вперед", for: .normal)
        backward.setTitle("Назад", for: .normal)
        
        forward.setTitleColor(.cyan, for: .normal)
        backward.setTitleColor(.cyan, for: .normal)
        
        forward.addTarget(self, action: #selector(goNext), for: .touchUpInside)
        backward.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        view.addSubview(mainStack)
        mainStack.addArrangedSubview(stack)
        mainStack.axis = .vertical
        mainStack.spacing = 20
        if step == 5{
            mainStack.addArrangedSubview(textLabel)
            mainStack.addArrangedSubview(objectLabel)
            guard let object else {return}
            guard let text else {return}
            objectLabel.text = "\(object.name) \(object.age) \(object.bool)"
            textLabel.text = text
        }
        mainStack.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
        }
        
        
    }
    @objc func goNext(){
        guard let step = step else { return }
        let controller = SecondViewController()
        controller.object = object
        controller.text = text
        controller.step = step + 1
        present(controller, animated: true)
    }
    @objc func goBack(){
        dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
