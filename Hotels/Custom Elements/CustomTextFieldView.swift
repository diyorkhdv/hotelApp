//
//  CustomTextField.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 12/01/24.
//

import UIKit

public class CustomTextFieldView: UIView {
    // MARK: - Properties
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "Номер телефона"
        label.textColor = UIColor(hex: "#A9ABB7", alpha: 1.0)
        return label
    }()
    
    let textField: CustomTextField = {
        let textfield = CustomTextField()
        textfield.backgroundColor = MainHotelColors.seperatorColor
        textfield.placeholder = "+7 (951) 555-99-00"
        textfield.layer.cornerRadius = 10
        return textfield
    }()
    // MARK: - Initialization
    required init(title: String, placeholder: String) {
        super.init(frame: .zero)
        textField.placeholder = placeholder
        label.text = title
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - UI Setup
    private func setupUI() {
        addSubview(textField)
        textField.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        textField.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(10)
        }
    }
    
    // MARK: - Public methods
    func setLabelText(_ text: String) {
        label.text = text
    }
    func getText() -> String? {
        return textField.text
    }
}
// MARK: - Paddings
class CustomTextField: UITextField {
    let padding = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
