//
//  Order.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 02.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import Foundation

class Order : ObservableObject {
    @Published var orderPositions: [OrderPosition] = []
    @Published var status : OrderStatus = .open
    @Published var id: Int
    @Published var address: Optional<Address> = nil
    
    init() {
        self.id = generateOrderId()
    }
    
    init(status: OrderStatus, positions: [OrderPosition]) {
        self.id = generateOrderId()
        self.status = status
        self.orderPositions = positions
    }
    
    func incrementCount(medicine: Medicine) {
        if let index = orderPositions.firstIndex(where: {$0.medicine.id == medicine.id}) {
            orderPositions[index].count += 1
        } else {
            orderPositions.append(OrderPosition(medicine: medicine, count: 1))
        }
    }
    
    func decrementCount(medicine: Medicine) {
        if let index = orderPositions.firstIndex(where: {$0.medicine.id == medicine.id}) {
            orderPositions[index].count -= 1
            if orderPositions[index].count == 0 {
                orderPositions.remove(at: index)
            }
        }
    }
}

func generateOrderId() -> Int {
    return Int.random(in: 0..<10000)
}

enum OrderStatus {
    case open
    case placed
    case completed
}
