//
//  HotelRoomTVCell.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 11/01/24.
//

import UIKit

class HotelRoomTVCell: UITableViewCell {
    static let id = "HotelRoomTVCell"
    var hotelRoomImages = [String]()
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
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsHorizontalScrollIndicator = false
        cv.allowsSelection = false
        cv.isScrollEnabled = true
        cv.register(MainHotelCVCell.self, forCellWithReuseIdentifier: MainHotelCVCell.id)
        cv.backgroundColor = .clear
        cv.isPagingEnabled = true
        return cv
    }()
    let pageControlView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 4
        return view
    }()
    let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.isEnabled = false
        return pageControl
    }()
    let locationTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Стандартный с видом на бассейн или сад"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
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
    let moreInfoView: UIView = {
        let mark = UIView()
        mark.backgroundColor = MainHotelColors.blueColor.withAlphaComponent(0.1)
        mark.layer.masksToBounds = true
        mark.layer.cornerRadius = 5
        return mark
    }()
    let moreInfoImageView: UIImageView = {
        let star = UIImageView()
        star.contentMode = .scaleAspectFit
        star.image = UIImage(named: "extra")?.withRenderingMode(.alwaysTemplate)
        star.tintColor = MainHotelColors.blueColor
        return star
    }()
    let moreInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "Подробнее о номере"
        label.textColor = MainHotelColors.blueColor
        label.font = label.font.withSize(16)
        return label
    }()
    let costLabel: UILabel = {
        let label = UILabel()
        label.text = "186 600 ₽"
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        return label
    }()
    let costSecondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "за 7 ночей с перелётом"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = MainHotelColors.buttonBackgroundColor
        button.layer.cornerRadius = 15
        button.setTitle("Выбрать номер", for: .normal)
        return button
    }()
    let bottomSeperatorView: UIView = {
        let separator = UIView()
        separator.backgroundColor = MainHotelColors.seperatorColor
        return separator
    }()
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.delegate = self
        collectionView.dataSource = self
        setupUI()
        pageControl.sizeToFit()
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
        
        mainView.addSubviews(collectionView, pageControlView, locationTitleLabel, feature1Label, feature2Label, feature3Label, moreInfoView, costLabel, costSecondaryLabel, mainButton)
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(257)
        }
        pageControlView.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView.snp.bottom).offset(-10)
            make.width.equalTo(60)
            make.centerX.equalToSuperview()
            make.height.equalTo(20)
        }
        pageControlView.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(20)
            make.centerX.centerY.equalToSuperview()
        }
        
        locationTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(14)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        feature1Label.snp.makeConstraints { make in
            make.top.equalTo(locationTitleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
        }
        feature2Label.snp.makeConstraints { make in
            make.top.equalTo(feature1Label)
            make.left.equalTo(feature1Label.snp.right).offset(10)
        }
        feature3Label.snp.makeConstraints { make in
            make.top.equalTo(feature2Label.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(16)
        }
        moreInfoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(feature2Label.snp.bottom).offset(46)
            make.height.equalTo(30)
            make.width.equalTo(205)
        }
        moreInfoView.addSubviews(moreInfoImageView, moreInfoLabel)
        moreInfoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.right.equalToSuperview().offset(-2)
            make.centerY.equalToSuperview()
        }
        moreInfoLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
        }
        costLabel.snp.makeConstraints { make in
            make.top.equalTo(moreInfoView.snp.bottom).offset(14)
            make.left.equalTo(moreInfoView)
        }
        costSecondaryLabel.snp.makeConstraints { make in
            make.bottom.equalTo(costLabel.snp.bottom).offset(-5)
            make.left.equalTo(costLabel.snp.right).offset(10)
        }
        mainButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(48)
            make.top.equalTo(costSecondaryLabel.snp.bottom).offset(16)
        }
    }
    func removeThirdFeature() {
        moreInfoView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(feature2Label.snp.bottom).offset(16)
            make.height.equalTo(30)
            make.width.equalTo(205)
        }
    }
}

// MARK: - UICollectionView Delegate || DataSource || FlowLayout
extension HotelRoomTVCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelRoomImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 257)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainHotelCVCell", for: indexPath) as! MainHotelCVCell
        cell.hotelImageView.tag = indexPath.item
        guard let imageUrl = URL(string: hotelRoomImages[indexPath.item]) else {
            return cell
        }
        cell.setImage(from: imageUrl)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSet = scrollView.contentOffset.x
        let width = scrollView.frame.width
        let page = (Int(round(offSet / width)))
        pageControl.currentPage = page
    }
}
// MARK: - Configure Data
extension HotelRoomTVCell {
    func configure(with hotelData: HotelRoomModel?) {
        guard let hotelData = hotelData else {
            return
        }
        locationTitleLabel.text = hotelData.name
        
        let cost = String(hotelData.price).insertSpace()
        costLabel.text = "\(cost) ₽"
        
        costSecondaryLabel.text = hotelData.pricePer
        feature1Label.text = hotelData.peculiarities[0]
        feature2Label.text = hotelData.peculiarities[1]
        if hotelData.peculiarities.count > 2 {
            feature3Label.text = hotelData.peculiarities[2]
        } else {
            feature3Label.isHidden = true
            removeThirdFeature()
        }
        hotelRoomImages = hotelData.imageUrls
        pageControl.numberOfPages = hotelRoomImages.count
        collectionView.reloadData()
    }
}

