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
            Image(element.medicine.imageName)
                .resizable()
                .frame(width: 120, height: 120)
            VStack {
                HStack {
                    Text(element.medicine.name)
                        .font(.title)
                    Spacer()
                }
                HStack {
                    Button(action: {
                        self.order.decrementCount(medicine: self.element.medicine)
                    }) {
                        Image(systemName: "minus")
                            .font(.system(size: 20))
                    }
                    
                    Text("\(element.count)")
                        .font(.headline)
                        .padding(.horizontal)
                    
                    Button(action: {
                        self.order.incrementCount(medicine: self.element.medicine)
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 20))
                    }
                    Spacer()
                    Text("\(element.medicine.price * Float(element.count), specifier: "%.2f")")
                        .padding(.horizontal)
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("pink"), lineWidth: 2)
        )
    }
}

struct OrderElementView_Previews: PreviewProvider {
    static var previews: some View {
        OrderElementView(element: getOrder.orderPositions[0], order: getOrder)
    }
}
