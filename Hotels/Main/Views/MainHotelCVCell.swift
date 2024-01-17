//
//  MainHotelCVCell.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 10/01/24.
//

import UIKit
import Alamofire

class MainHotelCVCell: UICollectionViewCell {
    static let id = "MainHotelCVCell"
    // MARK: - UI Elements
    let hotelImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = MainHotelColors.seperatorColor
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.isHidden = true
        return activityIndicator
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(hotelImageView)
        backgroundColor = .white
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    private func setupUI() {
        addSubviews(hotelImageView, activityIndicator)
        hotelImageView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.top.equalToSuperview()
        }
        activityIndicator.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(50)
        }
    }
    func setImage(from url: URL) {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                    self.hotelImageView.image = image
                }
            }
        }
    }
}
