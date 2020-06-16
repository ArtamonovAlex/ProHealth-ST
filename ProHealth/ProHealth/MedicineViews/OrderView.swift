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
    order.incrementCount(medicine: MedicineData[0])
    order.incrementCount(medicine: MedicineData[1])
    return order
}()

struct OrderView: View {
    @ObservedObject var order: Order
    var userAddresses: [Address] = AddressData
    @State var selectedAdress = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("Заказ")
                    .font(.title)
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView {
                ForEach(order.orderPositions) { orderPosition in
                    OrderElementView(element: orderPosition, order: self.order)
                }
                
                HStack {
                    Text("Адреса")
                        .font(.title)
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
                AddressesView(selected: $selectedAdress, userAddresses: userAddresses)
                
                Button(action: {
                    
                }) {
                    Text("Оформить заказ")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal, 100)
                        .foregroundColor(.white)
                        .background(Color("pink"))
                        .cornerRadius(20)
                    
                }
                Spacer()
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        
        OrderView(order: getOrder)
    }
}
