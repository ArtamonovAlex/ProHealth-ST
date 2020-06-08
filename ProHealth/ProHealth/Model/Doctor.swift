//
//  Doctor.swift
//  ProHealth
//
//  Created by Валерия Самонина on 08.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//
import Foundation
import SwiftUI
import CoreLocation

struct Doctor: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var category: String
    var imageName: String
}

