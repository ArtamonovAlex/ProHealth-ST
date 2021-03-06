//
//  AdressesView.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 15.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct AddressesView: View {
    @Binding var selected: Int
    @EnvironmentObject var userData: UserData
    @State var isAddressCreationFormOpen = false
    
    
    var body: some View {
        VStack {
            RadioButtonGroup(items: $userData.addresses, selectedId: $selected) { address in
                HStack {
                    VStack{
                        HStack {
                            Text("\(address.label)")
                                .font(.headline)
                                .foregroundColor(Color("pink"))
                                .padding(.horizontal)
                            Spacer()
                        }
                        Text("\(address.fullAddress)")
                            .padding(.horizontal)
                            .foregroundColor(.primary)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    Spacer()
                }
                .padding(5)
            }
            Button(action: {
                self.$isAddressCreationFormOpen.wrappedValue.toggle()
            }) {
                Image(systemName: "plus.circle")
                    .font(.system(size: 28))
                    .foregroundColor(Color("pink"))
                    .padding(.bottom)
            }
        }
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("pink"), lineWidth: 2)
        )
            .sheet(isPresented: $isAddressCreationFormOpen) {
                CreateAddressView(callback: {address in
                    self.userData.addresses.append(address)
                })
        }
    }
}

struct AdressesView_Previews: PreviewProvider {
    static var previews: some View {
        AddressesView(selected: .constant(1)).environmentObject(UserData(addresses: AddressData))
    }
}

struct RadioButton<Content: View>: View {

    let id: Int
    @Binding var selectedID : Int
    let content: () -> Content
    
    init(
        _ id: Int,
        selectedID: Binding<Int>,
        content: @escaping () -> Content
    ) {
        self.id = id
        self._selectedID = selectedID
        self.content = content
    }
    
    var body: some View {
        Button(action:{
            self.selectedID = self.id
        }) {
            HStack {
                Image(systemName: self.selectedID == self.id ? "largecircle.fill.circle" : "circle")
                    .padding(.leading)
                    .foregroundColor(Color("pink"))
                
                content()
            }
            .overlay(
                Rectangle()
                    .stroke(Color("pink"), lineWidth: 2)
            )
        }
    }
}

struct RadioButtonGroup<Content: View>: View {
    
    @Binding var items : [Address]
    @Binding var selectedId: Int
    let content: (Address) -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(items, id: \.id) { item in
                    RadioButton(item.id, selectedID: self.$selectedId) {
                        self.content(item)
                    }
            }
        }
    }
}
