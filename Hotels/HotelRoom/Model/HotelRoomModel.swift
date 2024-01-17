//
//  HotelRoomModel.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 15/01/24.
//

import Foundation

struct HotelRoomModel: Codable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]
}

struct RoomsResponseModel: Codable {
    let rooms: [HotelRoomModel]
}
