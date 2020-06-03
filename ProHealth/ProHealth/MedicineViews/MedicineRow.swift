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
    @ObservedObject var order : Order
    
    var body: some View {
        HStack {
            Text(medicine.name)
                .font(.title)
            Spacer()
            Stepper(
                onIncrement: {
                    if self.ammount == 0 {
                        self.ammount += 1
                        self.order.add(medicine: self.medicine)
                    } else {
                        self.ammount += 1
                        self.order.incrementCount(medicine: self.medicine)
                    }
                },
                onDecrement: {
                    if self.ammount != 0 {
                        self.ammount -= 1
                        self.order.decrementCount(medicine: self.medicine)
                    }
            })
            {
                Text("\(ammount)")
                    .font(.title)
            }
            .fixedSize()
        }
        .padding()
    }
}

struct MedicineRow_Previews: PreviewProvider {
    static var previews: some View {
        MedicineRow(medicine: MedicineData[0], order: Order())
            .previewLayout(.fixed(width: 400, height: 70))
    }
}
