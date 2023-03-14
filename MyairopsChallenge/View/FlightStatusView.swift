//
//  FlightStatusView.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 14/03/23.
//

import SwiftUI

struct FlightStatusView: View {
    
    let aircraft: Aircraft
    @Binding var  status: FlightStatus
    @Binding var path: Path
     
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                TopBannerView(aircraft: aircraft, onTapEnabled: false, flightStatus: $status)
                Text("Flight status: " + status.completionNote)
                    .padding(.vertical)
                Divider()
                Button {
                    path.push(to: .last)
                } label: {
                    Text("Next Page")
                        .frame(maxWidth: .infinity)
                }
                .padding()
            }
        }
        .padding()
    }
}

struct FlightStatusView_Previews: PreviewProvider {
    @State static var path: Path = []
    @State static var s: FlightStatus = .Fuel
    static var previews: some View {
        FlightStatusView(aircraft: a, status: $s, path: $path)
    }
}
