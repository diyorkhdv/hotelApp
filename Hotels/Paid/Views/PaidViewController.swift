//
//  PaidViewController.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 12/01/24.
//

import UIKit

class PaidViewController: UIViewController {
    // MARK: - Coordinator
    var coordinator: HotelCoordinator?
    // MARK: - UI
    let firstImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "paid")
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ваш заказ принят в работу"
        label.font = label.font.withSize(22)
        label.textColor = .black
        return label
    }()
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(16)
        label.textColor = MainHotelColors.grayColor
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    let mainButtonView: UIView = {
        let btnView = UIView()
        btnView.layer.borderWidth = 1
        btnView.layer.borderColor = MainHotelColors.strokeColor.cgColor
        btnView.backgroundColor = .white
        return btnView
    }()
    let mainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = MainHotelColors.buttonBackgroundColor
        button.layer.cornerRadius = 15
        button.setTitle("Супер!", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        addTargets()
        generateRandomNumber()
    }
    func generateRandomNumber() {
        let randomOrder = Int.random(in: 0...999999)
        subtitleLabel.text = "Подтверждение заказа №\(randomOrder) может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление."
    }
    // MARK: - Actions
    @objc func mainButtonTapped() {
        coordinator?.showMainHotelVC()
    }
    func addTargets() {
        mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
    }
    func setupUI() {
        view.addSubviews(firstImageView, titleLabel, subtitleLabel, mainButtonView)
        firstImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.width.height.equalTo(94)
            make.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(firstImageView.snp.bottom).offset(40)
            make.centerX.equalToSuperview()
        }
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        mainButtonView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(88)
        }
        mainButtonView.addSubview(mainButton)
        mainButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(48)
            make.centerY.equalToSuperview().offset(-8)
        }
    }
}
