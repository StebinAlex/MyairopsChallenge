//
//  Style.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 14/03/23.
//

import SwiftUI

struct BlueBorderTextFieldWithDecimalPad: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(maxWidth: 80)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .border(.blue)
            .keyboardType(.decimalPad)
    }
}
