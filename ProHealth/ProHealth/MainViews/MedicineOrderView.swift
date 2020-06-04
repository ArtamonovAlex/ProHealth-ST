//
//  MedicineOrderView.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 01.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct MedicineOrderView: View {
    
    @ObservedObject var order : Order = Order()
    @State var isOrderOpen = false
    @State var isDetailsOpen : Bool = false
    @State var selectedMedicine: Medicine?
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack {
                Spacer()
                OrderButton(show: $isOrderOpen)
            }
            .padding()
            .sheet(isPresented: $isOrderOpen) {
                OrderView(order: self.order)
            }
            
            VStack {
                HStack {
                    Text("Заказ лекарств")
                        .font(.title)
                    
                    Spacer()
                }
                .padding()
                
                VStack {
                    ForEach(MedicineData) { medicine in
                        MedicineRow(medicine: medicine, order: self.order)
                            .onTapGesture {
                                self.isDetailsOpen.toggle()
                                self.selectedMedicine = medicine
                        }
                    }
                }
                Spacer()
            }
            .blur(radius: isOrderOpen ? 10 : 0)
            .animation(.default)
            .sheet(isPresented: $isDetailsOpen) {
                MedicineDetail(medicine: self.selectedMedicine!, order: self.order)
            }
        }
    }
}

struct MedicineOrderView_Previews: PreviewProvider {
    static var previews: some View {
        MedicineOrderView()
    }
}

struct OrderButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: { self.show.toggle() }) {
            Image(systemName: "bag")
                .font(.system(size: 28))
        }
    }
}
