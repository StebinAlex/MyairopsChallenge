//
//  PageData.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import SwiftUI

enum PageData : String, CaseIterable, Identifiable  {
    var id: String {
        self.rawValue
    }
    
    case flights = "Flights"
    case contacts = "Contacts"
    case settings = "Settings"
    
    
}

extension PageData {
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .flights:
            FlightListView()
                
        case .contacts:
            ContactsView()
        case .settings:
            SettingsView()
        }
    }
    
    var image: String {
        switch self {
        case .flights:
            return "airplane"
        case .contacts:
            return "phone"
        case .settings:
            return "gear"
        }
    }
    
}
