//
//  MenuButton.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 14/03/23.
//

import SwiftUI

struct MenuButton: View {
    
    var items: [String] = ["Lbs", "Kg"]
    var unit: String
    var onChange: (String) -> Void
    
    var body: some View {
        Menu {
            ForEach(items, id: \.self) { i in
                Button {
                    onChange(i)
                } label: {
                    Text(i)
                }
            }
        } label: {
            HStack {
                Text(unit)
                Image(systemName: "chevron.up.chevron.down")
            }
        }
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(unit: "Lbs") { _ in }
    }
}
