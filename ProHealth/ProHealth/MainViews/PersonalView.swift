//
//  PersonalView.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 01.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct PersonalView: View {
    
    @EnvironmentObject var userData: UserData

    var body: some View {
        VStack {
            HStack {
                Avatar(userData.avatar == "" ? "avatar_icon" : userData.avatar)
                Text("\(userData.fullName)")
                    .font(.system(size: 22))
                    .padding(.horizontal)
            }
            .padding(.top)
            ScrollView {
                HStack {
                    Text("Активные заказы:")
                        .font(.headline)
                        .padding(.horizontal)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 10) {
                        ForEach(self.userData.orders.filter({ order in
                            order.status == OrderStatus.placed
                        }), id: \.id) {order in
                            Button(action: {
                                
                            }) {
                                VStack {
                                    Text("Заказ №\(order.id)")
                                        .font(.headline)
                                        .foregroundColor(Color("pink"))
                                        .padding()
                                    ForEach(order.orderPositions) {position in
                                        Text("\(position.medicine.name) x\(position.count)")
                                            .foregroundColor(Color.primary)
                                            .padding(.bottom)
                                    }
                                }
                                
                            }
                            .background(Color(.white))
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                    }
                    .padding(5)
                }
                HStack {
                    Text("Прошлые заказы:")
                        .font(.headline)
                        .padding(.horizontal)
                    Spacer()
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 10) {
                        ForEach(self.userData.orders.filter({ order in
                            order.status == OrderStatus.completed
                        }), id: \.id) {order in
                            Button(action: {
                                
                            }) {
                                VStack {
                                    Text("Заказ №\(order.id)")
                                        .font(.headline)
                                        .foregroundColor(Color("pink"))
                                        .padding()
                                    ForEach(order.orderPositions) {position in
                                        Text("\(position.medicine.name) x\(position.count)")
                                            .foregroundColor(Color.primary)
                                            .padding(.bottom)
                                    }
                                }
                                
                            }
                            .background(Color(.white))
                            .cornerRadius(20)
                            .shadow(radius: 5)
                        }
                    }
                    .padding(5)
                }
            }
        }
    }
}

struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalView().environmentObject(UserData(orders: [
            Order(status: .placed, positions: [
                OrderPosition(medicine: Medicine(id: 0, name: "Афобазол", price: 300, description: "", imageName: ""), count: 3)
            ]),
            Order(status: .placed, positions: [
                OrderPosition(medicine: Medicine(id: 0, name: "Бепантен", price: 300, description: "", imageName: ""), count: 10),
                OrderPosition(medicine: Medicine(id: 0, name: "Афобазол", price: 300, description: "", imageName: ""), count: 3)
            ]),
            Order(status: .placed, positions: [
                OrderPosition(medicine: Medicine(id: 0, name: "Афобазол", price: 300, description: "", imageName: ""), count: 3)
            ]),
            Order(status: .completed, positions: [
                OrderPosition(medicine: Medicine(id: 0, name: "Афобазол", price: 300, description: "", imageName: ""), count: 3)
            ])
        ]))
    }
}

struct Avatar: View {
    var image: String
    
    var body: some View {
        Image(image)
        .resizable()
        .frame(width: 50, height: 50)
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color("pink"), lineWidth: 4))
        .shadow(radius: 10)
    }
    init(_ image: String) {
        self.image = image
    }
}
