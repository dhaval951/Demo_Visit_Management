//
//  GoForVisitScreen.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import SwiftUI
import SwiftData


// Screen 4: After "Go for Visit"
struct GoForVisitScreen: View {
    let onBack: () -> Void
    let onReachedDestination: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            CustomHeader(title: "Visit for John Doe", onBack: onBack)
            TabBar(activeTab: .constant(.info)) // Keep info tab active for this screen

            ScrollView {
                VStack(spacing: 15) {
//                    CustomerInfoView() // Using generic CustomerInfoView here
//                    JobScheduleView() // Using generic JobScheduleView here
//                    LineItemsView() // Using generic LineItemsView here
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

            HStack(spacing: 15) {
                Button(action: {
                    // Action to cancel visit
                    print("Visit Cancelled!")
                    onBack() // Go back to info screen after cancelling
                }) {
                    Text("Cancel Visit")
                        .font(.headline)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.1))
                        .cornerRadius(10)
                }

                Button(action: onReachedDestination) {
                    Text("Reached Destination")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}
