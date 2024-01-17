//
//  MainHotelTVCell.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 10/01/24.
//

import UIKit

class MainHotelTVCell: UITableViewCell {
    static let id = "MainHotelTVCell"
    var hotelImages = [String]()
    // MARK: - UI Elements
    let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
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
        pageControl.numberOfPages = 1
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.isEnabled = false
        return pageControl
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
        label.text = "Steigenberger Makadi"
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        label.numberOfLines = 2
        return label
    }()
    let locationSecondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "Madinat Makadi, Safaga Road, Makadi Bay, Египет"
        label.font = label.font.withSize(14)
        label.textColor = MainHotelColors.blueColor
        return label
    }()
    let costLabel: UILabel = {
        let label = UILabel()
        label.text = "от 134 673 ₽"
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        return label
    }()
    let costSecondaryLabel: UILabel = {
        let label = UILabel()
        label.text = "за тур с перелётом"
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        return label
    }()
    let seperatorView: UIView = {
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
        addSubviews(mainView, seperatorView)
        mainView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
        seperatorView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(10)
        }
        bringSubviewToFront(mainView)
        
        mainView.addSubviews(collectionView, pageControlView, markView, locationTitleLabel, locationSecondaryLabel, costLabel, costSecondaryLabel)
        collectionView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalToSuperview()
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
        markView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(collectionView.snp.bottom).offset(16)
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
            make.right.equalToSuperview().offset(-16)
        }
        locationSecondaryLabel.snp.makeConstraints { make in
            make.top.equalTo(locationTitleLabel.snp.bottom).offset(14)
            make.left.equalTo(markView)
        }
        costLabel.snp.makeConstraints { make in
            make.top.equalTo(locationSecondaryLabel.snp.bottom).offset(14)
            make.left.equalTo(markView)
        }
        costSecondaryLabel.snp.makeConstraints { make in
            make.bottom.equalTo(costLabel.snp.bottom).offset(-5)
            make.left.equalTo(costLabel.snp.right).offset(10)
        }
    }
}

// MARK: - UICollectionView Delegate || DataSource || FlowLayout
extension MainHotelTVCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 257)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainHotelCVCell", for: indexPath) as! MainHotelCVCell
        cell.hotelImageView.tag = indexPath.item
        guard let imageUrl = URL(string: hotelImages[indexPath.item]) else {
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
extension MainHotelTVCell {
    func configure(with hotelData: MainHotelModel?) {
            guard let hotelData = hotelData else {
                return
            }
        locationTitleLabel.text = hotelData.name
        locationSecondaryLabel.text = hotelData.adress
        
        let cost = String(hotelData.minimalPrice).insertSpace()
        costLabel.text = "от \(cost) ₽"
        
        costSecondaryLabel.text = hotelData.priceForIt
        markLabel.text = String(hotelData.rating)
        markSecondaryLabel.text = hotelData.ratingName
        hotelImages = hotelData.imageUrls
        pageControl.numberOfPages = hotelImages.count
        collectionView.reloadData()
        }
}
