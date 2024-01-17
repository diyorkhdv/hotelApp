//
//  CustomerInfoTVCell.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 12/01/24.
//

import UIKit

class CustomerInfoTVCell: UITableViewCell {
    static let id = "CustomerInfoTVCell"
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
    // label textfield textfield label
    let customerInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Информация о покупателе"
        label.font = label.font.withSize(22)
        label.textColor = .black
        return label
    }()
    let numberTextField: CustomTextFieldView = {
        let textfieldView = CustomTextFieldView(title: "Номер телефона", placeholder: "+7 (951) 555-99-00")
        textfieldView.textField.keyboardType = .numberPad
        textfieldView.textField.text = "+7 (951) 555-99-00"
        return textfieldView
    }()
    let mailTextField: CustomTextFieldView = {
        let textfieldView = CustomTextFieldView(title: "Почта", placeholder: "examplemail.000@mail.ru")
        textfieldView.textField.text = "examplemail.000@mail.ru"
        textfieldView.textField.keyboardType = .emailAddress
        return textfieldView
    }()
    let dataInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту"
        label.font = label.font.withSize(14)
        label.textColor = MainHotelColors.grayColor
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
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
        numberTextField.textField.delegate = self
        mailTextField.textField.delegate = self

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tapGesture)
    }
    @objc func handleTap() {
        numberTextField.textField.resignFirstResponder()
        mailTextField.textField.resignFirstResponder()
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
        mainView.addSubviews(customerInfoLabel, numberTextField, mailTextField, dataInfoLabel)
        customerInfoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        numberTextField.snp.makeConstraints { make in
            make.top.equalTo(customerInfoLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(52)
        }
        mailTextField.snp.makeConstraints { make in
            make.top.equalTo(numberTextField.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(52)
        }
        dataInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(mailTextField.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
}
// MARK: - TextField Delegate
extension CustomerInfoTVCell: UITextFieldDelegate {
    // MARK: - Number Validation
    func formattedNumber(number: String) -> String {
        let cleanPhoneNumber = number.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mask = "+* (***) ***-**-**"
        var result = ""
        var index = cleanPhoneNumber.startIndex
        
        for ch in mask where index < cleanPhoneNumber.endIndex {
            if ch == "*" {
                result.append(cleanPhoneNumber[index])
                index = cleanPhoneNumber.index(after: index)
            } else {
                result.append(ch)
            }
        }
        
        return result
    }
    // MARK: - Email Validation
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == numberTextField.textField {
            numberTextField.textField.placeholder = "+7 (***) ***-**-**"
        } else {
            mailTextField.textField.placeholder = "examplemail.000@mail.ru"
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == numberTextField.textField {
            guard let text = numberTextField.textField.text else { return false }
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            numberTextField.textField.text = formattedNumber(number: newString)
            return false
        } else {
            return true
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == mailTextField.textField {
            let isValid = isValidEmail(textField.text ?? "")
            mailTextField.textField.backgroundColor = isValid ? MainHotelColors.seperatorColor : MainHotelColors.errorTextFieldColor
        } else {
            let isEmpty = textField.text?.isEmpty
            let symbolCount = textField.text?.count
            if isEmpty ?? true || symbolCount != 18 {
                numberTextField.textField.backgroundColor = MainHotelColors.errorTextFieldColor
            } else {
                numberTextField.textField.backgroundColor = MainHotelColors.seperatorColor
            }
        }
    }
}
