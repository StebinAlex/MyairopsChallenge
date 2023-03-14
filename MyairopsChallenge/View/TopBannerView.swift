//
//  TopBannerView.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 14/03/23.
//

import SwiftUI

struct TopBannerView: View {
    
    let aircraft: Aircraft
    var onTapEnabled: Bool = true
    @Binding var flightStatus: FlightStatus
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Image(systemName: "info.circle")
                            .font(.title)
                        Text(aircraft.typeName)
                            .minimumScaleFactor(0.01)
                    }
                    Text(aircraft.airlineName + " -> " + aircraft.engineType + " -> " + aircraft.model)
                        .minimumScaleFactor(0.01)
                }
                .padding(.horizontal, 20)
                .padding(.top, 10)
                Spacer()
            }
            .foregroundColor(.blue)
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(Color.gray.opacity(0.2))
            
            BreadcrumbView(onTapEnabled: onTapEnabled, flightStatus: $flightStatus)
                .frame(height: 80)
        }
        .cornerRadius(15)
        .overlay (
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

struct TopBannerView_Previews: PreviewProvider {
    
    @State static var s: FlightStatus = .Fuel
    
    static var previews: some View {
        TopBannerView(aircraft: a, flightStatus: $s)
    }
}
