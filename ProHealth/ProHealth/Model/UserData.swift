//
//  UserData.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 19.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import Foundation

class UserData: ObservableObject {
    var firstName: String = "Александр"
    var lastName: String = "Артамонов"
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    var avatar: String = ""
    @Published var orders: [Order] = []
    @Published var appointments: [Appointment] = []
    
    init() {}
    
    init(orders: [Order], appointments: [Appointment] = []) {
        self.orders = orders
        self.appointments = appointments
    }
}
