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
    
    init() {
        
    }
    
    func incrementCount(medicine: Medicine) {
        if let index = orderPositions.firstIndex(where: {$0.id == medicine.id}) {
            orderPositions[index].ammount += 1
        } else {
            orderPositions.append(OrderPosition(
                id: medicine.id,
                name: medicine.name,
                ammount: 1,
                price: medicine.price
            ))
        }
    }
    
    func decrementCount(medicine: Medicine) {
        if let index = orderPositions.firstIndex(where: {$0.id == medicine.id}) {
            orderPositions[index].ammount -= 1
            if orderPositions[index].ammount == 0 {
                orderPositions.remove(at: index)
            }
        }
    }
    
    func add(medicine : Medicine) {
        orderPositions.append(OrderPosition(
            id: medicine.id,
            name: medicine.name,
            ammount: 1,
            price: medicine.price
        ))
    }
}
