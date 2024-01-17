//
//  ExtraInfoTVCell.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 11/01/24.
//

import UIKit

class ExtraInfoTVCell: UITableViewCell {
    static let id = "ExtraInfoTVCell"
    // MARK: - UI Elements
    let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon1")
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Удобства"
        label.font = label.font.withSize(16)
        label.textColor = .black
        return label
    }()
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Самое необходимое"
        label.font = label.font.withSize(14)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let moreImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "extra")
        return imageView
    }()
    let bottomSeperatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = MainHotelColors.grayColor.withAlphaComponent(0.15)
        return separator
    }()
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = MainHotelColors.featureBackgroundColor
        setupUI()
    }
    func setupUI() {
        addSubviews(firstImageView, titleLabel, subtitleLabel, moreImageView, bottomSeperatorView)
        firstImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(firstImageView.snp.right).offset(10)
            make.top.equalToSuperview().offset(10)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
        }
        moreImageView.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(25)
        }
        bottomSeperatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.left.equalTo(titleLabel)
            make.right.equalToSuperview().offset(-16)
        }
    }
}
