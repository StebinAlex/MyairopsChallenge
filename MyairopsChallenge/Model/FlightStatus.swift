//
//  FlightStatus.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 14/03/23.
//

import Foundation

enum FlightStatus: String, CaseIterable {
    case Fuel
    case Passengers
    case Depart
    case Arrive
    case PFSB
    
    var index: Int {
        switch self {
        case .Fuel:
            return 0
        case .Passengers:
            return 1
        case .Depart:
            return 2
        case .Arrive:
            return 3
        case .PFSB:
            return 4
        }
    }
    
    var id: String {
        self.rawValue
    }
    
    var completionNote: String {
        switch self {
        case .Fuel:
            return "Fuel filling completed"
        case .Passengers:
            return "Passengers on boarding completed "
        case .Depart:
            return "Flight Departed"
        case .Arrive:
            return "Flight Arrived"
        case .PFSB:
            return "PFSB Completed"
        }
    }
}
