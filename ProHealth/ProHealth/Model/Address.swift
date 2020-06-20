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
    
    init(id: Int, label: String, city: String, street: String, building: String, flat: String) {
        self.id = id
        self.label = label
        self.city = city
        self.street = street
        self.building = building
        self.flat = flat
    }
    
    init(label: String, city: String, street: String, building: String, flat: String) {
        self.id = Int.random(in: 0..<10000)
        self.label = label
        self.city = city
        self.street = street
        self.building = building
        self.flat = flat
    }
}

extension Address {
    var fullAddress: String {
        return "г. \(self.city), \(self.street), д. \(self.building), \(self.flat)"
    }
}
