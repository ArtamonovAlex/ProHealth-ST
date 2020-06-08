//
//  MedicineDetail.swift
//  ProHealth
//
//  Created by Aleksandr Artamonov on 03.06.2020.
//  Copyright © 2020 Aleksandr Artamonov. All rights reserved.
//

import SwiftUI

struct DoctorsDetail: View {
    
    var doctor: Doctor
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    Image(doctor.imageName)
                        .resizable()
                        .frame(height: 300)
                    
                    HStack {
                        Text(doctor.name)
                            .font(.title)
                        Spacer()
                    }
                    .padding(.leading)
                }
            }
        }
    }
}

struct DoctorsDetail_Previews: PreviewProvider {
    static var previews: some View {
        DoctorsDetail(doctor: DoctorsData[0])
    }
}

