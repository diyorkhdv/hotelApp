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
    var customCellHeight = 72.0
    var isfirstTouristCellExpanded = true
    var isSecondTouristCellExpanded = false
    var isTouristCellExpanded = false
    var totalCells = 7
    // MARK: - Coordinator
    var coordinator: HotelCoordinator?
    // MARK: - ViewModel || Model
    let viewModel = BookingViewModel()
    var hotelRoomModel: BookingModel?
    // MARK: - User Data
    var dataSource = [
        "HotelNameTVCell",
        "BookingInfoTVCell",
        "CustomerInfoTVCell",
        "FirstTouristTVCell",
        "SecondTouristTVCell",
        "AddTouristTVCell",
        "FooterTVCell"
    ]
    var isTouristCellExpandedArray: [Bool] = []
    // MARK: - UI Elements
    let mainTableView: UITableView = {
        let tableview = UITableView()
        // 7 cells
        tableview.register(HotelNameTVCell.self, forCellReuseIdentifier: HotelNameTVCell.id)
        tableview.register(BookingInfoTVCell.self, forCellReuseIdentifier: BookingInfoTVCell.id)
        tableview.register(CustomerInfoTVCell.self, forCellReuseIdentifier: CustomerInfoTVCell.id)
        tableview.register(FirstTouristTVCell.self, forCellReuseIdentifier: FirstTouristTVCell.id)
        tableview.register(SecondTouristTVCell.self, forCellReuseIdentifier: SecondTouristTVCell.id)
        tableview.register(NewTouristTVCell.self, forCellReuseIdentifier: NewTouristTVCell.id)
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
        var allCellsValid = true
        
        for section in 0..<mainTableView.numberOfSections {
            for row in 0..<mainTableView.numberOfRows(inSection: section) {
                if let firstCell = mainTableView.cellForRow(at: IndexPath(row: row, section: section)) as? FirstTouristTVCell {
                    if !firstCell.areTextFieldsValid() {
                        showErrorAlert(message: "Заполните все поля")
                        allCellsValid = false
                        //                        break
                    }
                } else if let secondCell = mainTableView.cellForRow(at: IndexPath(row: row, section: section)) as? SecondTouristTVCell {
                    if !secondCell.areTextFieldsValid() {
                        showErrorAlert(message: "Заполните все поля")
                        allCellsValid = false
                        break
                    }
                }
            }
            
            if !allCellsValid {
                break
            }
        }
        
        if allCellsValid {
            setupCustomBackButton()
            coordinator?.showPaidVC()
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
        print("add tourist button tapped")
        totalCells += 1
//        totalTourists += 1

        dataSource.insert("NewTouristTVCell", at: dataSource.firstIndex(of: "AddTouristTVCell")!)
        while isTouristCellExpandedArray.count <= dataSource.count {
            isTouristCellExpandedArray.append(false)
        }
        mainTableView.reloadData()
    }
    @objc func newTouristButtonTapped(_ sender: UIButton) {
        let index = sender.tag

        guard index < isTouristCellExpandedArray.count else {
            // Ensure the index is within the array bounds
            return
        }

        isTouristCellExpandedArray[index].toggle()

        let buttonImages = [UIImage(named: "expandUP"), UIImage(named: "expandDOWN")]
        sender.setImage(isTouristCellExpandedArray[index] ? buttonImages[0] : buttonImages[1], for: .normal)
        
        customCellHeight = isTouristCellExpandedArray[index] ? 450.0 : 72.0

        UIView.animate(withDuration: 0.3) { [self] in
            self.mainTableView.beginUpdates()
            self.mainTableView.endUpdates()
        }
    }
}
// MARK: - Tableview Delegate || DataSource
extension BookingViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellData = dataSource[indexPath.row]
        switch cellData {
        case "HotelNameTVCell":
            return 170
        case "BookingInfoTVCell":
            return 300
        case "CustomerInfoTVCell":
            return 252
        case "FirstTouristTVCell":
            return customFirstCellHeight
        case "SecondTouristTVCell":
            return customSecondCellHeight
        case "AddTouristTVCell":
            return 72.0
        case "FooterTVCell":
            return 160
        default:
            return customCellHeight
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return totalCells
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = dataSource[indexPath.row]
        switch cellData {
        case "HotelNameTVCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: "HotelNameTVCell", for: indexPath) as! HotelNameTVCell
            cell.configure(with: hotelRoomModel)
            return cell
        case "BookingInfoTVCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: "BookingInfoTVCell", for: indexPath) as! BookingInfoTVCell
            cell.configure(with: hotelRoomModel)
            return cell
        case "CustomerInfoTVCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerInfoTVCell", for: indexPath) as! CustomerInfoTVCell
            return cell
        case "FirstTouristTVCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: "FirstTouristTVCell", for: indexPath) as! FirstTouristTVCell
            cell.expandButton.addTarget(self, action: #selector(firstTouristButtonTapped), for: .touchUpInside)
            return cell
        case "SecondTouristTVCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: "SecondTouristTVCell", for: indexPath) as! SecondTouristTVCell
            cell.customerInfoLabel.text = "Второй турист"
            cell.expandButton.addTarget(self, action: #selector(secondTouristButtonTapped), for: .touchUpInside)
            return cell
        case "AddTouristTVCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddTouristTVCell", for: indexPath) as! AddTouristTVCell
            cell.expandButton.addTarget(self, action: #selector(addTouristButtonTapped), for: .touchUpInside)
            return cell
        case "FooterTVCell":
            let cell = tableView.dequeueReusableCell(withIdentifier: "TotalCostTVCell", for: indexPath) as! TotalCostTVCell
            cell.configure(with: hotelRoomModel)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewTouristTVCell", for: indexPath) as! NewTouristTVCell
            cell.expandButton.tag = indexPath.row
            let touristNumber = indexPath.row - 2
            let ruNumber = russianOrdinalNumber(touristNumber)
            print("ruNumber.row: \(ruNumber)")
            cell.customerInfoLabel.text = "\(ruNumber) турист"
            cell.expandButton.addTarget(self, action: #selector(newTouristButtonTapped), for: .touchUpInside)
            return cell
        }
    }
    // Function to convert number to Russian ordinal number
    func russianOrdinalNumber(_ number: Int) -> String {
        return "\(number)-й"
    }
}

