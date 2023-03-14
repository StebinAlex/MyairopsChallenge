//
//  Aircraft.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import Foundation

struct Aircraft: Codable, Identifiable {
    var id: Int
    var reg: String
    var active: Bool
    var serial, airlineName, iataCodeShort, icaoCode: String
    var model, modelCode: String
    var numSeats: Int?
    var rolloutDate, firstFlightDate, deliveryDate, registrationDate: String
    var typeName: String
    var numEngines: Int
    var engineType: String
    var isFreighter: Bool
    var productionLine: String
    var ageYears: Double
    var verified: Bool
    var numRegistrations: Int
    var image: Image?
    
    // MARK: - Image
    struct Image: Codable {
        var url: String
        var webURL: String
        var author, title, description, license: String
        var htmlAttributions: [String]
        
        enum CodingKeys: String, CodingKey {
            case url
            case webURL = "webUrl"
            case author, title, description, license, htmlAttributions
        }
    }
}


