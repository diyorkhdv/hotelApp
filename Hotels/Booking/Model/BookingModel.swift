//
//  BookingModel.swift
//  Hotels
//
//  Created by Diyor Khalmukhamedov on 15/01/24.
//

import Foundation

import Foundation

struct BookingModel: Codable {
    let id: Int
    let hotelName: String
    let hotelAdress: String
    let horating: Int
    let ratingName: String
    let departure: String
    let arrivalCountry: String
    let tourDateStart: String
    let tourDateStop: String
    let numberOfNights: Int
    let room: String
    let nutrition: String
    let tourPrice: Int
    let fuelCharge: Int
    let serviceCharge: Int
}
