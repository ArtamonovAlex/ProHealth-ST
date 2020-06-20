//
//  ContentView.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 01.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    @EnvironmentObject var userData: UserData
 
    var body: some View {
        TabView(selection: $selection){
            PersonalView()
            .environmentObject(userData)
                .tabItem {
                    Image(systemName: "person.fill")
                        .imageScale(.large)
                    Text("Главная")
                }
                .tag(0)
            
            MedicineOrderView()
                .environmentObject(userData)
                .tabItem {
                    Image(systemName: "cart.fill")
                        .imageScale(.large)
                    Text("Заказ лекарств")
                }
                .tag(1)
            
            AppointmentsView()
                .environmentObject(userData)
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                        .imageScale(.large)
                    Text("Запись на приём")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(UserData())
    }
}
