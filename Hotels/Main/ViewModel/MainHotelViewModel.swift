//
//  MainHotelViewModel.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 14/01/24.
//

import Foundation

final class MainHotelViewModel {
    
    var onDataUpdate: ((MainHotelModel) -> Void)?
    var onError: ((Error) -> Void)?
    
    func getHotelInfo() {
        NetworkManager.shared.post(url: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473", parameters: nil) { (result: Result<MainHotelModel, Error>) in
            switch result {
            case .success(let response):
                self.onDataUpdate?(response)
            case .failure(let error):
                self.onError?(error)
            }
        }
    }
}
