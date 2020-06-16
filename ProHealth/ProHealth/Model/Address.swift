//
//  Adress.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 15.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import Foundation

struct Address: Hashable, Codable, Identifiable {
    var id: Int
    var label: String
    var city: String
    var street: String
    var building: String
    var flat: String
}

extension Address {
    var fullAddress: String {
        return "г. \(self.city), \(self.street), д. \(self.building), \(self.flat)"
    }
}
