//
//  BookingViewModel.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 15/01/24.
//

import Foundation

import Foundation

final class BookingViewModel {
    
    var onDataUpdate: ((BookingModel) -> Void)?
    var onError: ((Error) -> Void)?
    
    func getBookingInfo() {
        NetworkManager.shared.post(url: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff", parameters: nil) { (result: Result<BookingModel, Error>) in
            switch result {
            case .success(let response):
                self.onDataUpdate?(response)
            case .failure(let error):
                self.onError?(error)
            }
        }
    }
}
