//
//  MainHotelModel.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 14/01/24.
//

import Foundation

struct MainHotelModel: Codable {
    let id: Int
    let name: String
    let adress: String
    let minimalPrice: Int
    let priceForIt: String
    let rating: Int
    let ratingName: String
    let imageUrls: [String]
    let aboutTheHotel: AboutTheHotel
}

struct AboutTheHotel: Codable {
    let description: String
    let peculiarities: [String]
}
