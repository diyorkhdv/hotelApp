//
//  HotelCoordinator.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 16/01/24.
//

import UIKit

class HotelCoordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let animationVC = AnimationViewController()
        animationVC.coordinator = self
        navigationController.pushViewController(animationVC, animated: false)
    }
    
    func showMainHotelVC() {
        let vc = MainHotelViewController()
        vc.coordinator = self
        vc.title = "Отель"
        vc.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationController.pushViewController(vc, animated: true)
    }
    func showHotelRoomVC(title: String) {
        let vc = HotelRoomViewController()
        vc.navLabel.text = title
        vc.coordinator = self
        vc.setupCustomBackButton()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showBookingVC() {
        let vc = BookingViewController()
        vc.coordinator = self
        vc.title = "Бронирование"
        vc.setupCustomBackButton()
        
        navigationController.navigationBar.titleTextAttributes = nil
        navigationController.pushViewController(vc, animated: true)
    }
    func showPaidVC() {
        let vc = PaidViewController()
        vc.coordinator = self
        vc.title = "Заказ оплачен"
        vc.setupCustomBackButton()
        navigationController.pushViewController(vc, animated: true)
    }
}

