//
//  OrderPosition.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 02.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import Foundation


struct OrderPosition: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var ammount: Int
    var price: Float
}
