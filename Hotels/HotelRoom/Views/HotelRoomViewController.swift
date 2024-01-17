//
//  HotelRoomViewController.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 11/01/24.
//

import UIKit

class HotelRoomViewController: UIViewController {
    // MARK: - Coordinator
    var coordinator: HotelCoordinator?
    // MARK: - Models
    let viewModel = HotelRoomViewModel()
    var hotelRoomData: RoomsResponseModel?
    // MARK: - UI Elements
    var navLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "This is a multiline string for the navBar"
        return label
    }()
    let mainTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(HotelRoomTVCell.self, forCellReuseIdentifier: HotelRoomTVCell.id)
        tableview.separatorStyle = .none
        tableview.allowsSelection = true
        tableview.backgroundColor = .white
        tableview.showsVerticalScrollIndicator = false
        tableview.allowsSelection = false
        return tableview
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        
        self.navigationItem.titleView = navLabel
        
        // delegate || dataSource
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        viewModel.onDataUpdate = { [weak self] hotelRoomModel in
            self?.hotelRoomData = hotelRoomModel
            
            self?.mainTableView.reloadData()
        }
        viewModel.onError = { [weak self] error in
            self?.showErrorAlert(message: "An error occurred. Please try again.")
        }
        viewModel.getRoomsInfo()
    }
    func setupUI() {
        view.addSubviews(mainTableView)
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-5)
        }
    }
    // MARK: - Actions
    @objc func mainButtonTapped() {
        coordinator?.showBookingVC()
    }
}
// MARK: - Tableview Delegate || DataSource
extension HotelRoomViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 565
        } else {
            let hotelRoom = hotelRoomData?.rooms[indexPath.item]
            if hotelRoom?.peculiarities.count ?? 2 > 2 {
                return 575
            } else {
                return 540
            }
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotelRoomData?.rooms.count ?? 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelRoomTVCell", for: indexPath) as! HotelRoomTVCell
        let hotelRoom = hotelRoomData?.rooms[indexPath.item]
        cell.configure(with: hotelRoom)
        cell.mainButton.addTarget(self, action: #selector(mainButtonTapped), for: .touchUpInside)

        return cell
    }
}
