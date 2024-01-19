//
//  NewTouristTVCell.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 13/01/24.
//

import UIKit

class NewTouristTVCell: UITableViewCell {
    static let id = "NewTouristTVCell"
    // MARK: - UI Elements
    let topSeperatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = MainHotelColors.seperatorColor
        return separator
    }()
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    let customerInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Первый турист"
        label.font = label.font.withSize(22)
        label.textColor = .black
        return label
    }()
    let expandButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = MainHotelColors.blueColor.withAlphaComponent(0.1)
        button.layer.cornerRadius = 6
        button.setImage(UIImage(named: "expandDOWN"), for: .normal)
        return button
    }()
    let nameTextField: CustomTextFieldView = {
        let textfieldView = CustomTextFieldView(title: "Имя", placeholder: "Иван")
        return textfieldView
    }()
    let surnameTextField: CustomTextFieldView = {
        let textfield = CustomTextFieldView(title: "Фамилия", placeholder: "Иванов")
        return textfield
    }()
    let ageTextField: PaddedTextField = {
        let textfield = PaddedTextField()
        textfield.placeholder = "Дата рождения"
        return textfield
    }()
    let citizenshipTextField: PaddedTextField = {
        let textfield = PaddedTextField()
        textfield.placeholder = "Гражданство"
        return textfield
    }()
    let passportNumberTextField: PaddedTextField = {
        let textfield = PaddedTextField()
        textfield.placeholder = "Номер загранпаспорта"
        return textfield
    }()
    let passportValidTextField: PaddedTextField = {
        let textfield = PaddedTextField()
        textfield.placeholder = "Срок действия загранпаспорта"
        return textfield
    }()
    let bottomSeperatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = MainHotelColors.seperatorColor
        return separator
    }()
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
        
        nameTextField.textField.delegate = self
        surnameTextField.textField.delegate = self
        ageTextField.delegate = self
        citizenshipTextField.delegate = self
        passportNumberTextField.delegate = self
        passportValidTextField.delegate = self
    }
    @objc func handleTap() {
        nameTextField.textField.resignFirstResponder()
        surnameTextField.textField.resignFirstResponder()
        ageTextField.resignFirstResponder()
        citizenshipTextField.resignFirstResponder()
        passportNumberTextField.resignFirstResponder()
        passportValidTextField.resignFirstResponder()
    }
    // MARK: - Check Validation
    func areTextFieldsValid() -> Bool {
        let isValid = !(nameTextField.textField.text?.isEmpty ?? true) &&
        !(surnameTextField.textField.text?.isEmpty ?? true) &&
        !(ageTextField.text?.isEmpty ?? true) &&
        !(citizenshipTextField.text?.isEmpty ?? true) &&
        !(passportNumberTextField.text?.isEmpty ?? true) &&
        !(passportValidTextField.text?.isEmpty ?? true)
        // Change background color based on validation
        updateTextFieldBackgroundColor(textField: nameTextField.textField)
        updateTextFieldBackgroundColor(textField: surnameTextField.textField)
        updateTextFieldBackgroundColor(textField: ageTextField)
        updateTextFieldBackgroundColor(textField: citizenshipTextField)
        updateTextFieldBackgroundColor(textField: passportNumberTextField)
        updateTextFieldBackgroundColor(textField: passportValidTextField)
        return isValid
    }
    private func updateTextFieldBackgroundColor(textField: UITextField) {
        textField.backgroundColor = textField.text?.isEmpty == true ? MainHotelColors.errorTextFieldColor : MainHotelColors.seperatorColor
    }
    // MARK: - Setup UI
    func setupUI() {
        addSubviews(topSeperatorView, mainView, bottomSeperatorView)
        topSeperatorView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(10)
        }
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-6)
        }
        bottomSeperatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(10)
        }
        bringSubviewToFront(mainView)
        mainView.addSubviews(customerInfoLabel, expandButton, nameTextField, surnameTextField, ageTextField, citizenshipTextField, passportNumberTextField, passportValidTextField)
        customerInfoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        expandButton.snp.makeConstraints { make in
            make.width.height.equalTo(32)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(16)
        }
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(customerInfoLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(52)
        }
        surnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(52)
        }
        ageTextField.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(52)
        }
        citizenshipTextField.snp.makeConstraints { make in
            make.top.equalTo(ageTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(52)
        }
        passportNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(citizenshipTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(52)
        }
        passportValidTextField.snp.makeConstraints { make in
            make.top.equalTo(passportNumberTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(52)
        }
    }
}
// MARK: - TextField Delegate
extension NewTouristTVCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = textField.text?.isEmpty == true ? MainHotelColors.errorTextFieldColor : MainHotelColors.seperatorColor
    }
}
