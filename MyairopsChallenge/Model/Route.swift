//
//  Route.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import SwiftUI
 
typealias Path = [Route]

extension Path {
    mutating func push(to page: Route) {
        self.append(page)
    }

    mutating func popToRoot() {
        self.removeAll()
    }
}

enum Route: Identifiable, Hashable {
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        return hasher.combine(id)
    }
    
    case settings
    case Contacts
    case flightDetails(Aircraft)
    case FlightStatus(Aircraft, Binding<FlightStatus>)
    case last
    case ContactDetail(Contact)
    
    var id: String {
        switch self {
        case .settings:
            return "settings"
        case .Contacts:
            return "contacts"
        case .flightDetails:
            return"flightDetails"
        case .FlightStatus:
            return "FlightStatus"
        case .last:
            return "last"
        case .ContactDetail:
            return "ContactDetail"
        }
    }
    
    struct NavigationContainerView<Content: View>: View {
        
        @Binding var path: Path
        
        /// Make Changes here for presentation
//        @State var sheet: Route?
//        @State var fullScreenCover: Route?
        
        @ViewBuilder var content: Content
        
        var body: some View {
            NavigationStack(path: $path) {
                content
                    .navigationDestination(for: Route.self) { route in
                        switch route {
                        case .settings:
                            SettingsView()
                        case .Contacts:
                            ContactsView()
                        case .flightDetails(let aircraft):
                            FlightDetailsView(aircraft: aircraft, path: $path)
                        case .FlightStatus(let aircraft, let flightStatus):
                            FlightStatusView(aircraft: aircraft, status: flightStatus, path: $path)
                        case .last:
                            LastView(path: $path)
                        case .ContactDetail(let contact):
                            Text(contact.name)
                        }
                    }
                     
            }
        }
        
        
    }
}





