//
//  DoctorsTimetable.swift
//  ProHealth
//
//  Created by Валерия Самонина on 19.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct DoctorsTimetable: View {
    var doctor: Doctor
    @State var availableTime: [String] = []
    @State var chosenDate: String = ""
    @State var chosenTime: String = ""
    @Binding var selectedDate: Date
    @Binding var isDateChosen: Bool
    let calendar = Calendar.current
    
    let dateFormatter = DateFormatter()

    var body: some View {
        VStack {
            Text("Выберите дату:")
            VStack {
                HStackWrap(items: doctor.availableTime.keys.sorted()){ date in
                    Button(action: {
                        self.availableTime = self.doctor.availableTime[date]!
                        self.chosenDate = date
                        self.chosenTime = ""
                        self.isDateChosen = false
                        
                    }) {
                        Text(date)
                            .fontWeight(.bold)
                            .foregroundColor(self.chosenDate != date ? Color("pink"): Color("purple"))
                            .padding(10)
                            .background(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.1))
                        .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(self.chosenDate != date ? Color("pink"): Color("purple"), lineWidth: 3)
                            )
                        
                    }
                }
            }
            .padding(.horizontal)
            VStack {
                Text("Выберите время:")
                HStackWrap(items: availableTime) { time in
                    Button(action: {
                        self.chosenTime = time
                        let dateArray = self.chosenDate.components(separatedBy: CharacterSet.decimalDigits.inverted)
                        let timeArray = self.chosenTime.components(separatedBy: CharacterSet.decimalDigits.inverted)
                        self.selectedDate = makeDate(month: Int(dateArray[1])!, day: Int(dateArray[0])!, hr: Int(timeArray[0])!, min: Int(timeArray[1])!)
                        self.isDateChosen = true
                    }) {
                        Text(time)
                            .fontWeight(.bold)
                            .foregroundColor(self.chosenTime != time ? Color("pink"): Color("purple"))
                            .padding(10)
                            .background(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0.1))
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(self.chosenTime != time ? Color("pink"): Color("purple"), lineWidth: 3)
                            )

                    }
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        
    }
}

struct DoctorsTimetable_Previews: PreviewProvider {
    static var previews: some View {
        DoctorsTimetable(doctor: DoctorsData[0], selectedDate: .constant(Date()), isDateChosen: .constant(true))
    }
}

func makeDate(month: Int, day: Int, hr: Int, min: Int) -> Date {
    var calendar = Calendar(identifier: .gregorian)
    let components = DateComponents(year: 2020, month: month, day: day, hour: hr, minute: min)
    calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    return calendar.date(from: components)!
}
