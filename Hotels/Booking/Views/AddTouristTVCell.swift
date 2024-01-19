//
//  AddTouristTVCell.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 19/01/24.
//

import UIKit

class AddTouristTVCell: UITableViewCell {

    static let id = "AddTouristTVCell"

    // MARK: - UI elements
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
//        view.backgroundColor = .green
        return view
    }()
    let customerInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Добавить туриста"
        label.font = label.font.withSize(22)
        label.textColor = .black
        return label
    }()
    let expandButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 6
        button.backgroundColor = MainHotelColors.blueColor
        button.setImage(UIImage(named: "plus"), for: .normal)
        return button
    }()
    let bottomSeperatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = MainHotelColors.seperatorColor
        return separator
    }()

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }

    private func setupUI() {
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
        mainView.addSubviews(customerInfoLabel, expandButton)
        customerInfoLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        expandButton.snp.makeConstraints { make in
            make.width.height.equalTo(32)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview().offset(16)
        }
    }
}
