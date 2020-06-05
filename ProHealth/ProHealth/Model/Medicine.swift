//
//  Medicine.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 02.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct Medicine: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var price: Float
    var description: String
    var imageName: String
}
