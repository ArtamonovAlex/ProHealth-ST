//
//  DoctorsRow.swift
//  ProHealth
//
//  Created by Валерия Самонина on 09.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct DoctorsRow: View {
    var categoryName: String
    var items: [Doctor]
    
    @EnvironmentObject var userData: UserData
    
    var body: some View {
            VStack(alignment: .leading) {
                Text(self.categoryName)
                    .font(.headline)
                    .padding(.leading, 15)
                    .padding(.top, 5)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .top, spacing: 0) {
                        ForEach(self.items) { doctor in
                            NavigationLink(
                                destination: DoctorsDetail(
                                    doctor: doctor
                                ).environmentObject(self.userData)
                            ) {
                                DoctorItem(doctor: doctor)
                            }
                        }
                    }
                }
                .frame(height: 185)
            }
    }
}

struct DoctorItem: View {
    var doctor: Doctor
    var body: some View {
        VStack(alignment: .leading) {
            Image(doctor.imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(doctor.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        DoctorsRow(
            categoryName: DoctorsData[0].category,
            items: DoctorsData
        ).environmentObject(UserData())
    }
}
