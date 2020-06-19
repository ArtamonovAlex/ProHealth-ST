//
//  MedicineRow.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 02.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct MedicineRow: View {
    var medicine: Medicine
    @State private var ammount = 0
    @State private var oldAmmount = 0
    @ObservedObject var order : Order
    
    var body: some View {
        HStack {
            Image(medicine.imageName)
            .resizable()
            .frame(width: 150, height: 150)
            
            VStack {
                HStack {
                    Text(medicine.name)
                         .font(.title)
                        .foregroundColor(.black)
                    
                    Spacer()
                }
                .padding()
                HStack {
                    Spacer()
                    Text("\(medicine.price, specifier: "%.2f")")
                        .font(.headline)
                        .foregroundColor(Color.green)
                }
                .padding()
            }
        }
        .frame(height: 120)
        .background(Color(.white))
        .cornerRadius(20)
        .shadow(radius: 5)
        
    }
}

struct MedicineRow_Previews: PreviewProvider {
    static var previews: some View {
        MedicineRow(medicine: MedicineData[0], order: Order())
            .previewLayout(.fixed(width: 380, height: 120))
    }
}
