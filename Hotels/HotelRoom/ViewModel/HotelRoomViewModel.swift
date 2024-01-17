//
//  HotelRoomViewModel.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 15/01/24.
//

import Foundation

final class HotelRoomViewModel {
    
    var onDataUpdate: ((RoomsResponseModel) -> Void)?
    var onError: ((Error) -> Void)?
    
    func getRoomsInfo() {
        NetworkManager.shared.post(url: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195", parameters: nil) { (result: Result<RoomsResponseModel, Error>) in
            switch result {
            case .success(let response):
                self.onDataUpdate?(response)
            case .failure(let error):
                self.onError?(error)
            }
        }
    }
}
