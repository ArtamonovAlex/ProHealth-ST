//
//  AppointmentsView.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 01.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct AppointmentsView: View {
    let categories: [String: [Doctor]] = Dictionary(
            grouping: DoctorsData,
            by: { $0.category }
        )

    var body: some View {
        NavigationView{
            List{
               ForEach(categories.keys.sorted(), id: \.self) { key in
                    DoctorsRow(categoryName: key, items: self.categories[key]!)
                .padding()
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle(Text("Запись на приём"))
        }
    }
}

struct AppointmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentsView()
    }
}
