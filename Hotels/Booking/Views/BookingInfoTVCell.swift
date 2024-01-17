//
//  BookingInfoTVCell.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 12/01/24.
//

import UIKit

class BookingInfoTVCell: UITableViewCell {
    static let id = "BookingInfoTVCell"
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
    // 14 labels
    let flightFromLabel: UILabel = {
        let label = UILabel()
        label.text = "Вылет из"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let actualflightFromLabel: UILabel = {
        let label = UILabel()
        label.text = "Москва"
        label.font = label.font.withSize(16)
        label.textColor = .black
        return label
    }()
    let flightToLabel: UILabel = {
        let label = UILabel()
        label.text = "Страна, город"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let actualflightToLabel: UILabel = {
        let label = UILabel()
        label.text = "Египет, Хургада"
        label.font = label.font.withSize(16)
        label.textColor = .black
        return label
    }()
    let datesLabel: UILabel = {
        let label = UILabel()
        label.text = "Даты"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let actualDatesLabel: UILabel = {
        let label = UILabel()
        label.text = "19.09.2023 – 27.09.2023"
        label.font = label.font.withSize(16)
        label.textColor = .black
        return label
    }()
    let nightCountLabel: UILabel = {
        let label = UILabel()
        label.text = "Кол-во ночей"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let actualNightCountLabel: UILabel = {
        let label = UILabel()
        label.text = "7 ночей"
        label.font = label.font.withSize(16)
        label.textColor = .black
        return label
    }()
    let hotelLabel: UILabel = {
        let label = UILabel()
        label.text = "Отель"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let actualHotelLabel: UILabel = {
        let label = UILabel()
        label.text = "Steigenberger Makadi"
        label.font = label.font.withSize(16)
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
    let roomLabel: UILabel = {
        let label = UILabel()
        label.text = "Номер"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let actualRoomLabel: UILabel = {
        let label = UILabel()
        label.text = "Стандартный с видом на бассейн или сад"
        label.font = label.font.withSize(16)
        label.numberOfLines = 2
        label.textColor = .black
        return label
    }()
    let foodLabel: UILabel = {
        let label = UILabel()
        label.text = "Питание"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let actualFoodLabel: UILabel = {
        let label = UILabel()
        label.text = "Все включено"
        label.font = label.font.withSize(16)
        label.textColor = .black
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
        mainView.addSubviews(flightFromLabel, actualflightFromLabel, flightToLabel, actualflightToLabel, datesLabel, actualDatesLabel, nightCountLabel, actualNightCountLabel, hotelLabel, actualHotelLabel, roomLabel, actualRoomLabel, foodLabel, actualFoodLabel)
        flightFromLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        actualflightFromLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(180)
        }
        flightToLabel.snp.makeConstraints { make in
            make.top.equalTo(flightFromLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(16)
        }
        actualflightToLabel.snp.makeConstraints { make in
            make.top.equalTo(flightToLabel)
            make.left.equalToSuperview().offset(180)
        }
        datesLabel.snp.makeConstraints { make in
            make.top.equalTo(flightToLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(16)
        }
        actualDatesLabel.snp.makeConstraints { make in
            make.top.equalTo(datesLabel)
            make.left.equalToSuperview().offset(180)
        }
        nightCountLabel.snp.makeConstraints { make in
            make.top.equalTo(datesLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(16)
        }
        actualNightCountLabel.snp.makeConstraints { make in
            make.top.equalTo(nightCountLabel)
            make.left.equalToSuperview().offset(180)
        }
        hotelLabel.snp.makeConstraints { make in
            make.top.equalTo(nightCountLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(16)
        }
        actualHotelLabel.snp.makeConstraints { make in
            make.top.equalTo(hotelLabel)
            make.left.equalToSuperview().offset(180)
            make.right.equalToSuperview().offset(-16)
        }
        roomLabel.snp.makeConstraints { make in
            make.top.equalTo(actualHotelLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(16)
        }
        actualRoomLabel.snp.makeConstraints { make in
            make.top.equalTo(roomLabel)
            make.left.equalToSuperview().offset(180)
            make.right.equalToSuperview().offset(-16)
        }
        foodLabel.snp.makeConstraints { make in
            make.top.equalTo(actualRoomLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(16)
        }
        actualFoodLabel.snp.makeConstraints { make in
            make.top.equalTo(foodLabel)
            make.left.equalToSuperview().offset(180)
        }
    }
}
// MARK: - Configure Data
extension BookingInfoTVCell {
    func configure(with hotelData: BookingModel?) {
        guard let hotelData = hotelData else {
            return
        }
        actualflightFromLabel.text = hotelData.departure
        actualflightToLabel.text = hotelData.arrivalCountry
        
        let tourDateStart = hotelData.tourDateStart
        let tourDateStop = hotelData.tourDateStop
        actualDatesLabel.text =  "\(tourDateStart) – \(tourDateStop)"
        
        actualNightCountLabel.text = "\(hotelData.numberOfNights) ночей"
        actualHotelLabel.text = hotelData.hotelName
        actualRoomLabel.text = hotelData.room
        actualFoodLabel.text = hotelData.nutrition
    }
}
