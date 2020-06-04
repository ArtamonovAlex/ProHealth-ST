//
//  MedicineDetail.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 03.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct MedicineDetail: View {
    
    var medicine: Medicine
    @ObservedObject var order: Order
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image(medicine.imageName)
                        .resizable()
                        .frame(height: 300)
                    
                    HStack {
                        Text(medicine.name)
                            .font(.title)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    HStack {
                        Text(medicine.description)
                        .padding()
                    }
                }
            }
            
            VStack {
                HStack {
                    Text("Стоимость")
                    Spacer()
                    Text("\(medicine.price, specifier: "%.2f")")
                        .font(.headline)
                }
                .padding()
                
                Button(action: {
                    self.order.incrementCount(medicine: self.medicine)
                }) {
                    Text("Добавить в корзину")
                        .font(.headline)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                }
                .padding()
                .background(Color("pink"))
                .cornerRadius(20)
            }
            .padding(.bottom)
            .background(Color(.white))
            .cornerRadius(/*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/, corners: [.topLeft, .topRight])
            .shadow(radius: 10)
        }
    }
}

struct MedicineDetail_Previews: PreviewProvider {
    static var previews: some View {
        MedicineDetail(medicine: MedicineData[0], order: Order())
    }
}


struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
