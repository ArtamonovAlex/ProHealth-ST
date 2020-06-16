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
    @State var userAddresses: [Address] = AddressData
    
    init(
        selected: Binding<Int>,
        userAddresses: [Address]
    ) {
        self._selected = selected
        self.userAddresses = userAddresses
    }
    
    var body: some View {
        VStack {
            RadioButtonGroup(items: userAddresses.count, selectedId: $selected) { index in
                HStack {
                    VStack{
                        HStack {
                            Text("\(self.userAddresses[index].label)")
                                .font(.headline)
                                .foregroundColor(Color("pink"))
                                .padding(.horizontal)
                            Spacer()
                        }
                        Text("\(self.userAddresses[index].fullAddress)")
                            .padding(.horizontal)
                            .foregroundColor(.primary)
                    }
                    Spacer()
                }
                .padding(5)
            }
            Button(action: {
                
            }) {
                Image(systemName: "plus.circle")
                    .font(.system(size: 28))
                    .foregroundColor(Color("pink"))
                    .padding(22)
            }
        }
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("pink"), lineWidth: 2)
        )
    }
}

struct AdressesView_Previews: PreviewProvider {
    static var previews: some View {
        AddressesView(selected: .constant(0), userAddresses: AddressData)
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

    let items : Int
    @Binding var selectedId: Int
    let content: (Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<items) { index in
                Spacer().frame(height: 0)
                RadioButton(index, selectedID: self.$selectedId) {
                    self.content(index)
                }
                Spacer().frame(height: 0)
            }
        }
    }
}
