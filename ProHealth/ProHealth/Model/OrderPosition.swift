//
//  OrderPosition.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 02.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import Foundation


class OrderPosition: ObservableObject, Identifiable {
    var medicine: Medicine
    @Published var count: Int
    
    init(medicine: Medicine, count: Int) {
        self.medicine = medicine
        self.count = count
    }
}
