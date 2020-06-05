//
//  OrderView.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 02.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

var getOrder : Order = {
    let order: Order = Order()
    order.incrementCount(medicine: MedicineData[0])
    return order
}()

struct OrderView: View {
    @ObservedObject var order: Order
    
    var body: some View {
            VStack {
                HStack {
                    Text("Заказ")
                        .font(.title)
                    
                    Spacer()
                }
                .padding()
                
                ForEach(order.orderPositions) { orderPosition in
                    OrderElementView(element: orderPosition, order: self.order)
                }
                
                Spacer()
            }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        
        OrderView(order: getOrder)
    }
}
