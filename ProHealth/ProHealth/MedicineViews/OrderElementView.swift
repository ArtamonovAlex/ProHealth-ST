//
//  OrderElementView.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 04.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct OrderElementView: View {
    @ObservedObject var element: OrderPosition
    @ObservedObject var order: Order
    
    var body: some View {
        HStack {
            Text(element.medicine.name)
                .font(.title)
            
            Spacer()
            Button(action: {
                self.order.decrementCount(medicine: self.element.medicine)
            }) {
                Image(systemName: "minus")
                    .font(.system(size: 30))
            }
            .disabled(element.count <= 0)
            
            Text("\(element.count)")
                .font(.title)
                .padding()
            
            Button(action: {
                self.order.incrementCount(medicine: self.element.medicine)
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 30))
            }
        }
        .padding()
    }
}

struct OrderElementView_Previews: PreviewProvider {
    static var previews: some View {
        OrderElementView(element: getOrder.orderPositions[0], order: getOrder)
    }
}
