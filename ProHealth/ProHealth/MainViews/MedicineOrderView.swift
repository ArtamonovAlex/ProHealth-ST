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
    @State var isDetailsOpen = false
    @State var selectedMedicine: Medicine?
    @EnvironmentObject var userData: UserData
    
    var body: some View {
        ZStack(alignment: .top) {
            HStack {
                Spacer()
                OrderButton(show: $isOrderOpen)
            }
            .padding()
            .sheet(isPresented: $isOrderOpen) {
                OrderView(order: self.order)
                    .environmentObject(self.userData)
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
        MedicineOrderView().environmentObject(UserData())
    }
}

struct OrderButton: View {
    @Binding var show: Bool
    
    var body: some View {
        Button(action: { self.show.toggle() }) {
            Image(systemName: "bag")
                .padding(12)
                .font(.system(size: 28))
                .background(Color.white)
                .cornerRadius(25)
            .shadow(radius: 10)
        }
    }
}
