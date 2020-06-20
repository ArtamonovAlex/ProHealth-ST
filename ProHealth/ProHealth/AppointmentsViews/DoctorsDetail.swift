//
//  DoctorsDetail.swift
//  ProHealth
//
//  Created by Валерия Самонина on 09.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct DoctorsDetail: View {
    
    var doctor: Doctor
    @State var selectedDate = Date()
    @State var isDateChosen = false
    @EnvironmentObject var userData: UserData

    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    HStack {
                        Image(doctor.imageName)
                            .resizable()
                            .frame(width:100, height:100)
                            .clipShape(Circle())
                        Text(doctor.name)
                            .font(.title)
                            .padding(.horizontal)
                    }
                    .padding(.bottom)
                    DoctorsTimetable(doctor: doctor, selectedDate: $selectedDate, isDateChosen: $isDateChosen)
                    Button(action: {
                        self.userData.appointments.append(Appointment(doctor: self.doctor, time: self.selectedDate))
                    }) {
                        Text("Записаться на прием")
                        .font(.headline)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                        }
                    .padding()
                    .background(isDateChosen ? Color("pink"): Color.gray)
                    .cornerRadius(20)
                    .disabled(!isDateChosen)
                }
            }
        }
    }
}

struct DoctorsDetail_Previews: PreviewProvider {
    static var previews: some View {
        DoctorsDetail(doctor: DoctorsData[0]).environmentObject(UserData())
    }
}
