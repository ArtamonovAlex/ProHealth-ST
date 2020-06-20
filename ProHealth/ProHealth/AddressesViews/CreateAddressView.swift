//
//  CreateAddressView.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 20.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct CreateAddressView: View {
    
    var callback: (Address) -> ()
    let cities = ["Москва", "Санкт-Петербург", "Самара", "Саяногорск"]
    @Environment(\.presentationMode) private var presentationMode
    
    @State var city: Int = 1
    @State var street: String = ""
    @State var building: String = ""
    @State var flat: String = ""
    @State var label: String = ""
    var body: some View {
        VStack {
            Picker("",selection: $city) {
                ForEach(0 ..< cities.count) {
                    Text(self.cities[$0])
                }
                }.labelsHidden()
            TextField(" Улица", text: $street)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(5)
            HStack{
                TextField(" Строение/Дом", text: $building)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(5)
                TextField(" Офис/Квартира", text: $flat)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(5)
            }
            TextField(" Название", text: $label)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(5)
            Button(action: {
                self.callback(Address(label: self.label, city: self.cities[self.city], street: self.street, building: self.building, flat: self.flat))
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Сохранить адрес")
                    .font(.headline)
                    .padding(.horizontal)
                    .foregroundColor(.white)
            }
            .padding()
            .background((building != "" && street != "" && label != "" && flat != "") ? Color("pink"): Color.gray)
            .cornerRadius(20)
            .disabled(!(building != "" && street != "" && label != "" && flat != ""))
            Spacer()
        }
    }
}

struct CreateAddressView_Previews: PreviewProvider {
    static var previews: some View {
        CreateAddressView(callback: { (Address) in })
    }
}
