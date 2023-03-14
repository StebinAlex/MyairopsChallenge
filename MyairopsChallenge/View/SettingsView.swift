//
//  SettingsView.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var path: Path = []
    
    var body: some View {
        Route.NavigationContainerView(path: $path) {
            ScrollView {
                VStack {
                    ForEach(settingsArray, id: \.id) { item in
                        settingsItemView(item)
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    private func settingsItemView(_ item: Settings) -> some View {
        return ZStack {
            colorScheme == .light ? Color.white : Color.black
            HStack {
                Image(systemName: item.icon)
                    .font(.title)
                    .padding(5)
                Text(item.name)
                    .font(.title3.bold())
                    .minimumScaleFactor(0.01)
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(height: 80)
        .cornerRadius(10)
        .shadow(color: colorScheme == .light ? Color.gray : Color.white.opacity(0.5), radius: 5)
        .padding()
    }
}
