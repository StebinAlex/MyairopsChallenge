//
//  ContentView.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import SwiftUI

struct ContentView: View {
     
    @State private var selectedTab = PageData.flights
     
    var body: some View {
        VStack { 
            TabView(selection: $selectedTab) {
                ForEach(PageData.allCases) { tab in
                    tab.view
                        .tabItem {
                            Label(tab.rawValue, systemImage: tab.image)
                        }
                }
            }
            
        } 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
