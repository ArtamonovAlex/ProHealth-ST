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
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                    HStack {
                        Text("Заказ лекарств")
                            .font(.title)
                        
                        Spacer()
                        
                        OrderButton(show: $isOrderOpen)
                    }
                    .padding()
                    
                    VStack {
                        ForEach(MedicineData) { medicine in
                            MedicineRow(medicine: medicine, order: self.order)
                        }
                    }
                    Spacer()
            }
            .blur(radius: isOrderOpen ? 10 : 0)
            .animation(.default)
            .sheet(isPresented: $isOrderOpen) {
                OrderView(order: self.order)
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
        ZStack(alignment: .topTrailing) {
             Button(action: { self.show.toggle() }) {
                Image(systemName: "bag")
          }
          Spacer()
       }
    }
}
