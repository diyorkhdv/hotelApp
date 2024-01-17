//
//  ViewController.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 10/01/24.
//

import UIKit
import SnapKit

class MainHotelViewController: UIViewController {
    // MARK: - Coordinator
    var coordinator: HotelCoordinator?
    // MARK: - ViewModel
    let viewModel = MainHotelViewModel()
    var hotelData: MainHotelModel?
    // MARK: - UI Elements
    let mainTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(MainHotelTVCell.self, forCellReuseIdentifier: MainHotelTVCell.id)
        tableview.register(AboutHotelTVCell.self, forCellReuseIdentifier: AboutHotelTVCell.id)
        tableview.register(MainHotelTVCell.self, forCellReuseIdentifier: MainHotelTVCell.id)
        tableview.separatorStyle = .none
        tableview.allowsSelection = true
        tableview.backgroundColor = .white
        tableview.showsVerticalScrollIndicator = false
        tableview.allowsSelection = false
        return tableview
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
        button.setTitle("К выбору номера", for: .normal)
        return button
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Отель"
        view.backgroundColor = .white
        setupUI()
        addTargets()
        // delegate || dataSource
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        viewModel.onDataUpdate = { [weak self] hotelModel in
            self?.hotelData = hotelModel
            
            self?.mainTableView.reloadData()
        }
        viewModel.onError = { [weak self] error in
            self?.showErrorAlert(message: "An error occurred. Please try again.")
        }
        getHotelInfo()
    }
    func addTargets() {
        mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)
    }
    func setupUI() {
        view.addSubviews(mainTableView, mainButtonView)
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(mainButtonView.snp.top)
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
    // MARK: - Actions
    @objc func mainButtonTapped() {
        coordinator?.showHotelRoomVC(title: hotelData?.name ?? "")
    }
    // MARK: - ViewModel Actions
    func getHotelInfo() {
        viewModel.getHotelInfo()
    }
}
// MARK: - Tableview Delegate || DataSource
extension MainHotelViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        switch index {
        case 0:
            return 470
        case 1:
            return 470
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = UITableViewCell()
        switch index {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainHotelTVCell", for: indexPath) as! MainHotelTVCell
            cell.configure(with: hotelData)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AboutHotelTVCell", for: indexPath) as! AboutHotelTVCell
            cell.configure(with: hotelData)
            return cell
        default:
            return cell
        }
    }
}
