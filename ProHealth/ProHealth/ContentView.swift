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
 
    var body: some View {
        TabView(selection: $selection){
            PersonalView()
                .tabItem {
                    Image(systemName: "person.fill")
                        .imageScale(.large)
                }
                .tag(0)
            
            MedicineOrderView()
                .tabItem {
                    Image(systemName: "cart.fill")
                        .imageScale(.large)
                }
                .tag(1)
            
            AppointmentsView()
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                        .imageScale(.large)
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
