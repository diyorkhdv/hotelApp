//
//  BookingViewController.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 12/01/24.
//

import UIKit

class BookingViewController: UIViewController {
    var customFirstCellHeight = 450.0
    var customSecondCellHeight = 72.0
    var customThirdCellHeight = 72.0
    var isfirstTouristCellExpanded = true
    var isSecondTouristCellExpanded = false
    var isThirdTouristCellExpanded = false
    var totalCellsCount = 7
//    var totalTouristCount = 2
    // MARK: - Coordinator
    var coordinator: HotelCoordinator?
    // MARK: - ViewModel || Model
    let viewModel = BookingViewModel()
    var hotelRoomModel: BookingModel?
    // MARK: - User Data
    var name = ""
    var surname = ""
    var birthDate = ""
    var citizenship = ""
    var passportNumber = ""
    var passportValidTill = ""
    // MARK: - UI Elements
    let mainTableView: UITableView = {
        let tableview = UITableView()
        // 7 cells
        tableview.register(HotelNameTVCell.self, forCellReuseIdentifier: HotelNameTVCell.id)
        tableview.register(BookingInfoTVCell.self, forCellReuseIdentifier: BookingInfoTVCell.id)
        tableview.register(CustomerInfoTVCell.self, forCellReuseIdentifier: CustomerInfoTVCell.id)
        tableview.register(FirstTouristTVCell.self, forCellReuseIdentifier: FirstTouristTVCell.id)
        tableview.register(SecondTouristTVCell.self, forCellReuseIdentifier: SecondTouristTVCell.id)
        tableview.register(AddTouristTVCell.self, forCellReuseIdentifier: AddTouristTVCell.id)
        tableview.register(TotalCostTVCell.self, forCellReuseIdentifier: TotalCostTVCell.id)
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
        view.backgroundColor = .white
        setupUI()
        addTargets()
        // delegate || dataSource
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        viewModel.onDataUpdate = { [weak self] hotelRoomModel in
            self?.hotelRoomModel = hotelRoomModel
            // Button Title change
            let overallPrice = hotelRoomModel.tourPrice + hotelRoomModel.fuelCharge + hotelRoomModel.serviceCharge
            let overallPriceStr = String(overallPrice).insertSpace()
            self?.mainButton.setTitle("Оплатить \(overallPriceStr) ₽", for: .normal)
            
            self?.mainTableView.reloadData()
        }
        viewModel.onError = { [weak self] error in
            self?.showErrorAlert(message: "An error occurred. Please try again.")
        }
        viewModel.getBookingInfo()
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
        for section in 0..<mainTableView.numberOfSections {
            for row in 0..<mainTableView.numberOfRows(inSection: section) {
                if let cell = mainTableView.cellForRow(at: IndexPath(row: row, section: section)) as? FirstTouristTVCell {
                    // Check each text field in the cell
                    if !cell.areTextFieldsValid() {
                        // Show an alert since at least one text field is empty
                        showErrorAlert(message: "Заполните все поля")
                        return
                    } else {
                        setupCustomBackButton()
                        coordinator?.showPaidVC()
                    }
                }
            }
        }
    }
    @objc func firstTouristButtonTapped(_ sender: UIButton) {
        customFirstCellHeight = isfirstTouristCellExpanded ? 450.0 : 72.0
        let buttonImages = [UIImage(named: "expandUP"), UIImage(named: "expandDOWN")]
        sender.setImage(isfirstTouristCellExpanded ? buttonImages[0] : buttonImages[1], for: .normal)
        isfirstTouristCellExpanded.toggle()
        UIView.animate(withDuration: 0.3) { [self] in
            mainTableView.beginUpdates()
            mainTableView.endUpdates()
        }
    }
    @objc func secondTouristButtonTapped(_ sender: UIButton) {
        customSecondCellHeight = isSecondTouristCellExpanded ? 450.0 : 72.0
        let buttonImages = [UIImage(named: "expandUP"), UIImage(named: "expandDOWN")]
        sender.setImage(isSecondTouristCellExpanded ? buttonImages[0] : buttonImages[1], for: .normal)
        isSecondTouristCellExpanded.toggle()
        UIView.animate(withDuration: 0.3) { [self] in
            mainTableView.beginUpdates()
            mainTableView.endUpdates()
        }
    }
    @objc func addTouristButtonTapped(_ sender: UIButton) {
        sender.backgroundColor = MainHotelColors.blueColor.withAlphaComponent(0.1)
        customThirdCellHeight = isThirdTouristCellExpanded ? 450.0 : 72.0
        let buttonImages = [UIImage(named: "expandUP"), UIImage(named: "expandDOWN")]
        sender.setImage(isThirdTouristCellExpanded ? buttonImages[0] : buttonImages[1], for: .normal)
        isThirdTouristCellExpanded.toggle()
        UIView.animate(withDuration: 0.3) { [self] in
            mainTableView.beginUpdates()
            mainTableView.endUpdates()
        }
    }
}
// MARK: - Tableview Delegate || DataSource
extension BookingViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        switch index {
        case 0:
            return 170
        case 1:
            return 300
        case 2:
            return 252
        case 3:
            return customFirstCellHeight
        case 4:
            return customSecondCellHeight
        case 5:
            return customThirdCellHeight
        case 6:
            return 160
        default:
            return customSecondCellHeight
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalCellsCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        switch index {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HotelNameTVCell", for: indexPath) as! HotelNameTVCell
            cell.configure(with: hotelRoomModel)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookingInfoTVCell", for: indexPath) as! BookingInfoTVCell
            cell.configure(with: hotelRoomModel)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerInfoTVCell", for: indexPath) as! CustomerInfoTVCell
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTouristTVCell", for: indexPath) as! FirstTouristTVCell
            cell.expandButton.addTarget(self, action: #selector(firstTouristButtonTapped), for: .touchUpInside)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTouristTVCell", for: indexPath) as! SecondTouristTVCell
            cell.customerInfoLabel.text = "Второй турист"
            cell.expandButton.addTarget(self, action: #selector(secondTouristButtonTapped), for: .touchUpInside)
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddTouristTVCell", for: indexPath) as! AddTouristTVCell
            cell.customerInfoLabel.text = "Добавить туриста"
            cell.expandButton.backgroundColor = MainHotelColors.blueColor
            cell.expandButton.setImage(UIImage(named: "plus"), for: .normal)
            cell.expandButton.addTarget(self, action: #selector(addTouristButtonTapped), for: .touchUpInside)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalCostTVCell", for: indexPath) as! TotalCostTVCell
            cell.configure(with: hotelRoomModel)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTouristTVCell", for: indexPath) as! SecondTouristTVCell
            return cell
        }
    }
}
