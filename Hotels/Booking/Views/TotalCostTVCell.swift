//
//  TotalCostTVCell.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 12/01/24.
//

import UIKit

class TotalCostTVCell: UITableViewCell {
    static let id = "TotalCostTVCell"
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
    let tourPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "Тур"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let actualTourPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "186 600 ₽"
        label.font = label.font.withSize(16)
        label.textColor = .black
        return label
    }()
    let fuelChargeLabel: UILabel = {
        let label = UILabel()
        label.text = "Топливный сбор"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let actualFuelChargeLabel: UILabel = {
        let label = UILabel()
        label.text = "9 300 ₽"
        label.font = label.font.withSize(16)
        label.textColor = .black
        return label
    }()
    let serviceChargeLabel: UILabel = {
        let label = UILabel()
        label.text = "Сервисный сбор"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let actualServiceChargeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 136 ₽"
        label.font = label.font.withSize(16)
        label.textColor = .black
        return label
    }()
    let overallCostLabel: UILabel = {
        let label = UILabel()
        label.text = "К оплате"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let actualOverallCostLabel: UILabel = {
        let label = UILabel()
        label.text = "198 036 ₽"
        label.font = label.font.withSize(16)
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
        mainView.addSubviews(tourPriceLabel, actualTourPriceLabel, fuelChargeLabel, actualFuelChargeLabel, serviceChargeLabel, actualServiceChargeLabel, overallCostLabel, actualOverallCostLabel)
        tourPriceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        actualTourPriceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        fuelChargeLabel.snp.makeConstraints { make in
            make.top.equalTo(tourPriceLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(16)
        }
        actualFuelChargeLabel.snp.makeConstraints { make in
            make.top.equalTo(fuelChargeLabel)
            make.right.equalToSuperview().offset(-16)
        }
        serviceChargeLabel.snp.makeConstraints { make in
            make.top.equalTo(fuelChargeLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(16)
        }
        actualServiceChargeLabel.snp.makeConstraints { make in
            make.top.equalTo(serviceChargeLabel)
            make.right.equalToSuperview().offset(-16)
        }
        overallCostLabel.snp.makeConstraints { make in
            make.top.equalTo(serviceChargeLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(16)
        }
        actualOverallCostLabel.snp.makeConstraints { make in
            make.top.equalTo(overallCostLabel)
            make.right.equalToSuperview().offset(-16)
        }
    }
}
// MARK: - Configure Data
extension TotalCostTVCell {
    func configure(with hotelData: BookingModel?) {
        guard let hotelData = hotelData else {
            return
        }
        let tourPrice = String(hotelData.tourPrice).insertSpace()
        actualTourPriceLabel.text = "\(tourPrice) ₽"
        
        let fuelCharge = String(hotelData.fuelCharge)
        actualFuelChargeLabel.text = "\(fuelCharge) ₽"
        
        let serviceCharge = String(hotelData.serviceCharge)
        actualServiceChargeLabel.text = "\(serviceCharge) ₽"
        
        let overallPrice = hotelData.tourPrice + hotelData.fuelCharge + hotelData.serviceCharge
        let overallPriceStr = String(overallPrice).insertSpace()
        actualOverallCostLabel.text = "\(overallPriceStr) ₽"
    }
}
