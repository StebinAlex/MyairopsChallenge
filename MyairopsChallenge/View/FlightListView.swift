//
//  FlightListView.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import SwiftUI
 
struct FlightListView: View {
    
    @StateObject var viewModel = FlightsViewModel(apiClient: URLSessionAPI())
    @Environment(\.colorScheme) var colorScheme 
    @State private var path: Path = []
    
    var body: some View {
        Route.NavigationContainerView(path: $path) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.aircrafts) { item in
                        aircraftView(item)
                            .onTapGesture {
                                path.push(to: .flightDetails(item))
                            }
                    }
                }
            }
            .padding()
            .navigationTitle("Aircraft List")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
    
    @ViewBuilder
    func aircraftView(_ aircraft: Aircraft) -> some View {
        ZStack {
            colorScheme == .light ? Color.white : Color.black
            HStack {
                Image(systemName: "airplane")
                    .font(.title)
                    .padding(5)
                Spacer()
                VStack {
                    HStack {
                        Text("Airline Name: ")
                        Text(aircraft.airlineName)
                        Spacer()
                    }
                    HStack {
                        Text("Type Name: ")
                        
                        Text(aircraft.typeName)
                        Spacer()
                    }
                }
                Spacer()
            }
            .font(.subheadline)
            .minimumScaleFactor(0.01)
            .padding()
        }
        .frame(height: 80)
        .cornerRadius(10)
        .shadow(color: colorScheme == .light ? Color.gray : Color.white.opacity(0.5), radius: 5)
        .padding()
    }
    
}
 
struct FlightListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
