//
//  HotelNameTVCell.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 12/01/24.
//

import UIKit

class HotelNameTVCell: UITableViewCell {
    static let id = "HotelNameTVCell"
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
    let markView: UIView = {
        let mark = UIView()
        mark.backgroundColor = MainHotelColors.markViewBackgroundColor.withAlphaComponent(0.2)
        mark.layer.masksToBounds = true
        mark.layer.cornerRadius = 5
        return mark
    }()
    let starImageView: UIImageView = {
        let star = UIImageView()
        star.contentMode = .scaleAspectFit
        star.image = UIImage(systemName: "star.fill")
        star.tintColor = MainHotelColors.markStarColor
        return star
    }()
    let markLabel: UILabel = {
        let label = UILabel()
        label.text = "5"
        label.textColor = MainHotelColors.markStarColor
        return label
    }()
    let markSecondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Превосходно"
        label.textColor = MainHotelColors.markStarColor
        return label
    }()
    let locationTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = "Steigenberger Makadi"
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    let locationSecondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
        label.font = label.font.withSize(14)
        label.textColor = MainHotelColors.blueColor
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
        
        mainView.addSubviews(markView, locationTitleLabel, locationSecondaryLabel)
        markView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
        markView.addSubviews(starImageView, markLabel, markSecondaryLabel)
        starImageView.snp.makeConstraints { make in
            make.width.height.equalTo(15)
            make.left.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
        }
        markLabel.snp.makeConstraints { make in
            make.left.equalTo(starImageView.snp.right).offset(3)
            make.centerY.equalToSuperview()
        }
        markSecondaryLabel.snp.makeConstraints { make in
            make.left.equalTo(markLabel.snp.right).offset(3)
            make.centerY.equalToSuperview()
        }
        locationTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(markView.snp.bottom).offset(14)
            make.left.equalTo(markView)
            make.right.equalToSuperview().offset(16)
        }
        locationSecondaryLabel.snp.makeConstraints { make in
            make.top.equalTo(locationTitleLabel.snp.bottom).offset(14)
            make.left.equalTo(markView)
        }
    }
}

// MARK: - Configure Data
extension HotelNameTVCell {
    func configure(with hotelData: BookingModel?) {
        guard let hotelData = hotelData else {
            return
        }
        markLabel.text = String(hotelData.horating)
        markSecondaryLabel.text = hotelData.ratingName
        locationTitleLabel.text = hotelData.hotelName
        locationSecondaryLabel.text = hotelData.hotelAdress
    }
}
