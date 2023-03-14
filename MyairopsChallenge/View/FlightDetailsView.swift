//
//  FlightDetailsView.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import SwiftUI

struct FlightDetailsView: View {
    
    let aircraft: Aircraft
    @Binding var path: Path
    @State private var departureFuelWeight: String = ""
    @State private var departureFuelUnit: String = "Lbs"
    @State private var aircraftWeight: String = ""
    @State private var aircraftUnit: String = "Lbs"
    @State private var fobWeight: String = ""
    @State private var fobUnit: String = "Gal"
    @State private var fuelWeight: String = ""
    @State private var fuelUnit: String = "Gal"
    @State private var fuelType: String = "JETA1"
    @State private var noUplift: Bool = false
    @State private var flightStatus: FlightStatus = .Fuel
     
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                TopBannerView(aircraft: aircraft, flightStatus: $flightStatus)
                    .padding()
                Group {
                    VStack(alignment: .leading, spacing: 8) {
                        departureViews()
                        aircraftViews()
                        fuelViews()
                    }
                    .padding()
                    Divider()
                    fuelTypeViews()
                        .padding()
                    Divider()
                    supplierView()
                        .padding()
                    Divider()
                    Text("PAYMENT METHOD")
                        .fontWeight(.bold)
                        .padding()
                    Divider()
                }
                
                if let imageUrl = aircraft.image?.url, let url = NSURL(string: imageUrl) {
                    ImageView(url: url)
                        .padding()
                    Divider()
                }
                
                Button {
                    path.push(to: .FlightStatus(aircraft, $flightStatus))
                } label: {
                    Text("Next Page")
                        .frame(maxWidth: .infinity)
                }
                .padding()
                 

            }
        } 
    }
}

struct FlightDetailsView_Previews: PreviewProvider {
    
    @State static var path: Path = []
    
    static var previews: some View {
        FlightDetailsView(aircraft: a, path: $path)
    }
}

extension FlightDetailsView {
      
    private func departureViews() -> some View {
        VStack(alignment: .leading) {
            Text("DEPARTURE FUEL")
                .fontWeight(.heavy)
                .padding(.top)
                .padding(.bottom, 3)
            Text("Uplift")
                .fontWeight(.bold)
            HStack {
                TextField("Enter", text: $departureFuelWeight)
                    .textFieldStyle(BlueBorderTextFieldWithDecimalPad())
                MenuButton(unit: departureFuelUnit) { val in
                    departureFuelUnit = val
                }
                Spacer()
                Text("No Uplift")
                Toggle(isOn: $noUplift) {}
                    .labelsHidden()
                
            }
        }
    }
    
    private func aircraftViews() -> some View {
        VStack(alignment: .leading) {
            Text("AIRCRAFT UPLIFT")
                .fontWeight(.heavy)
                .padding(.top)
                .padding(.bottom, 3)
            HStack {
                VStack(alignment: .leading) {
                    Text("Uplift")
                        .fontWeight(.bold)
                    HStack {
                        TextField("Enter", text: $aircraftWeight)
                            .textFieldStyle(BlueBorderTextFieldWithDecimalPad())
                            .layoutPriority(0)
                        MenuButton(unit: aircraftUnit) { val in
                            aircraftUnit = val
                        }
                    }
                }
                Spacer()
                VStack(alignment: .leading) {
                    Text("FOB")
                        .fontWeight(.bold)
                    HStack {
                        TextField("Enter", text: $fobWeight)
                            .textFieldStyle(BlueBorderTextFieldWithDecimalPad())
                            .layoutPriority(0)
                        MenuButton(items: ["Gal", "Lt"], unit: fobUnit) { val in
                            fobUnit = val
                        }
                    }
                }
            }
        }
    }
    
    private func fuelViews() -> some View {
        VStack(alignment: .leading) {
            Text("FUEL SUPPLIER")
                .fontWeight(.heavy)
                .padding(.top)
                .padding(.bottom, 3)
            Text("Supplied")
                .fontWeight(.bold)
            HStack {
                TextField("Enter", text: $fuelWeight)
                    .textFieldStyle(BlueBorderTextFieldWithDecimalPad())
                MenuButton(items: ["Gal", "Lt"], unit: fuelUnit) { val in
                    fuelUnit = val
                }
                
            }
        }
    }
    
    
    private func fuelTypeViews() -> some View {
        VStack(alignment: .leading) {
            Text("FUEL SUPPLIER")
                .fontWeight(.heavy)
                .padding(.top)
            Text("Supplied")
                .fontWeight(.bold)
            MenuButton(items: ["JETA1", "JetB", "Avgas 100 LL Mogas", "Biokerosene"], unit: fuelType) { type in
                fuelType = type
            }
        }
    }
    
    private func supplierView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Supplier:")
                    .fontWeight(.bold)
                Text("Call Operations for fuel")
            }
            Spacer(minLength: 50)
            Text("Price:")
                .fontWeight(.bold)
        }
    }
    
    
}
  
