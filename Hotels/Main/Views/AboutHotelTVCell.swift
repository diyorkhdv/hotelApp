//
//  AboutHotelTVCell.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 10/01/24.
//

import UIKit

class AboutHotelTVCell: UITableViewCell {
    static let id = "AboutHotelTVCell"
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
    let aboutHotelLabel: UILabel = {
        let label = UILabel()
        label.text = "Об отеле"
        label.font = label.font.withSize(22)
        return label
    }()
    let feature1Label: PaddedLabel = {
        let label = PaddedLabel()
        label.text = "3-я линия"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let feature2Label: PaddedLabel = {
        let label = PaddedLabel()
        label.text = "3-я линия"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let feature3Label: PaddedLabel = {
        let label = PaddedLabel()
        label.text = "3-я линия"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let feature4Label: PaddedLabel = {
        let label = PaddedLabel()
        label.text = "3-я линия"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let hotelDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Отель VIP-класса с собственными гольф полями. Высокий уровнь сервиса. Рекомендуем для респектабельного отдыха. Отель принимает гостей от 18 лет!"
        label.numberOfLines = 0
        label.font = label.font.withSize(16)
        return label
    }()
    let extraInfoTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(ExtraInfoTVCell.self, forCellReuseIdentifier: ExtraInfoTVCell.id)
        tableview.separatorStyle = .none
        tableview.allowsSelection = false
        tableview.backgroundColor = .gray
        tableview.showsVerticalScrollIndicator = false
        tableview.layer.cornerRadius = 15
        tableview.layer.masksToBounds = true
        tableview.isScrollEnabled = false
        return tableview
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
        extraInfoTableView.delegate = self
        extraInfoTableView.dataSource = self
    }
    func setupUI() {
        addSubviews(topSeperatorView, mainView,bottomSeperatorView)
        topSeperatorView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(10)
        }
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
        bottomSeperatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(20)
        }
        bringSubviewToFront(mainView)
        mainView.addSubviews(aboutHotelLabel, hotelDescriptionLabel, extraInfoTableView, feature1Label, feature2Label, feature3Label, feature4Label)
        aboutHotelLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.equalToSuperview().offset(16)
        }
        feature1Label.snp.makeConstraints { make in
            make.top.equalTo(aboutHotelLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
        }
        feature2Label.snp.makeConstraints { make in
            make.top.equalTo(feature1Label.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
        }
        feature3Label.snp.makeConstraints { make in
            make.top.equalTo(feature2Label.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
        }
        feature4Label.snp.makeConstraints { make in
            make.top.equalTo(feature3Label)
            make.left.equalTo(feature3Label.snp.right).offset(10)
        }
        hotelDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(feature4Label.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        extraInfoTableView.snp.makeConstraints { make in
            make.top.equalTo(hotelDescriptionLabel.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
        
    }
}

// MARK: - Tableview Delegate || DataSource
extension AboutHotelTVCell: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExtraInfoTVCell", for: indexPath) as! ExtraInfoTVCell
        let images = [UIImage(named: "icon1"), UIImage(named: "icon2"), UIImage(named: "icon3")]
        let titles = ["Удобства", "Что включено", "Что не включено"]
        cell.firstImageView.image = images[index]
        cell.titleLabel.text = titles[index]
        return cell
    }
}

extension AboutHotelTVCell {
    func configure(with hotelData: MainHotelModel?) {
            guard let hotelData = hotelData else {
                return
            }
        let peculiarities = hotelData.aboutTheHotel.peculiarities
        feature1Label.text = peculiarities[0]
        feature2Label.text = peculiarities[2]
        feature3Label.text = peculiarities[1]
        feature4Label.text = peculiarities[3]
        hotelDescriptionLabel.text = hotelData.aboutTheHotel.description
        setupUI()
        }
}
