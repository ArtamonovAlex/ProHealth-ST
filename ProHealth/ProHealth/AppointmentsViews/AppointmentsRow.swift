import SwiftUI

struct AppointmentsRow: View {
    var doctorName: String
    var items: [Doctor]
    //var doctor: Doctor
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.doctorName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { doctor in
                        NavigationLink(
                            destination: DoctorsDetail(doctor: doctor  )
                        ) {
                            DoctorsItem(doctor: doctor )
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct DoctorsItem: View {
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

struct AppointmentsRow_Previews: PreviewProvider {
    static var previews: some View {
        AppointmentsRow(
            doctorName: "Oculists",
            items: [Doctor(id: 1, name: "Masha", category: "oculist", imageName: "oculist1"), Doctor(id: 1, name: "Masha", category: "oculist", imageName: "oculist1"),Doctor(id: 1, name: "Masha", category: "oculist", imageName: "oculist1")]
        )
    }
}

