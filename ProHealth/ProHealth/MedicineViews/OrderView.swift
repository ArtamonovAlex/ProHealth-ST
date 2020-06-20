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
    @State var userAddresses: [Address] = AddressData
    @State var selectedAdress = 1
    @EnvironmentObject var userData: UserData
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                Text("Заказ")
                    .font(.title)
                    .padding(.top)
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
                AddressesView(selected: $selectedAdress, userAddresses: $userAddresses)
                
                Button(action: {
                    self.order.status = OrderStatus.placed
                    self.order.address = self.userAddresses[self.selectedAdress]
                    self.userData.orders.append(self.order)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Оформить заказ")
                        .font(.headline)
                        .padding()
                        .padding(.horizontal, 100)
                        .foregroundColor(.white)
                        .background(order.orderPositions.count != 0 ? Color("pink") : Color.gray)
                        .cornerRadius(20)
                    
                }
                .disabled(order.orderPositions.count == 0)
                Spacer()
            }
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        
        OrderView(order: getOrder).environmentObject(UserData())
    }
}
