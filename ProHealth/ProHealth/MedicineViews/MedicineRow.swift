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
    
    func changeAmmount(_ : Bool) {
        if ammount > oldAmmount {
            order.incrementCount(medicine: medicine)
        }
        if ammount < oldAmmount {
            order.decrementCount(medicine: medicine)
        }
        oldAmmount = ammount
    }
    
    var body: some View {
        HStack {
            Text(medicine.name)
                .font(.title)
            Spacer()
            Stepper(value: $ammount, in: 0...medicine.ammount, onEditingChanged: changeAmmount)
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
