//
//  ContentView.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//
import SwiftUI

// Screen 5: After "Reached Destination"
struct ReachedDestinationScreen: View {
    let visitStartTime: Date?
    let currentTime: Date
    let onBack: () -> Void
    let onStartWork: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            CustomHeader(title: "Visit for John Doe", onBack: onBack)
            TabBar(activeTab: .constant(.info)) // Keep info tab active

            ScrollView {
                VStack(spacing: 15) {
//                    CustomerInfoView()
//                    JobScheduleView(visitStartTime: visitStartTime, currentTime: currentTime) // Pass current time
//                    LineItemsView()
                    
                    DetailsSectionView() // New section
                    Divider()
                        .foregroundColor(.gray)
                    TeamSectionView() // New section
                    Divider()
                        .foregroundColor(.gray)
                    JobScheduleStaticView() // Updated static schedule view
                    Divider()
                        .foregroundColor(.gray)
                    LineItemsStaticView() // Updated static line items view
                    Divider()
                        .foregroundColor(.gray)
                }
                .padding(.vertical)
            }

            Spacer()

            Button(action: onStartWork) {
                Text("Start Work")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}
