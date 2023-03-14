//
//  Contact.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 14/03/23.
//

import Foundation

struct Contact: Identifiable {
    var id = UUID()
    var name: String
    var phone: String
}

let contacts = [Contact(name: "John", phone: "07776687564"), Contact(name: "Mark", phone: "07775366263"), Contact(name: "Lily", phone: "07663536357"), Contact(name: "Smith", phone: "07856564322")]
