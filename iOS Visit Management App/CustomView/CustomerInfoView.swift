//
//  ContentView.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import SwiftUI

struct CustomerInfoView: View {
    var body: some View {
        CardView(title: "Customer Information") {
            VStack(alignment: .leading, spacing: 8) {
                Text("John Doe")
                    .font(.title2)
                    .fontWeight(.medium)

                HStack {
                    Image(systemName: "phone.fill")
                        .foregroundColor(.gray)
                    Text("+1 555-0100")
                    Spacer()
                    Button("Call") {
                        // Action to initiate call
                        print("Calling...")
                    }
                    .foregroundColor(.blue)
                }

                Text("JOB ID: 78901")

                HStack {
                    Image(systemName: "map.fill")
                        .foregroundColor(.gray)
                    Text("123 Ocean Avenue, New York, United States")
                    Spacer()
                    Button("Get Directions") {
                        // Action to open map
                        print("Getting directions...")
                    }
                    .foregroundColor(.blue)
                }

                Text("Description: Thoroughly clean and sanitize assigned areas, ensuring all surfaces, fixtures, and appliances are immaculate and meet highest hygiene standards.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.top, 5)
            }
        }
    }
}
