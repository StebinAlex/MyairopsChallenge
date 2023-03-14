//
//  Settings.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 14/03/23.
//

import Foundation

struct Settings: Identifiable {
    let id = UUID()
    var name: String
    var icon: String
    
}

let settingsArray = [Settings(name: "About", icon: "info.circle"),
                     Settings(name: "Update", icon: "paperplane.circle"),
                     Settings(name: "Notifications", icon: "bell.circle"),
                     Settings(name: "Backup", icon: "externaldrive.badge.icloud"),
                     Settings(name: "Contact", icon: "phone.circle")]
