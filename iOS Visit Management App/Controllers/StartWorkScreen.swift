//
//  ContentView.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//
import SwiftUI

struct StartWorkScreen: View {
    let workStartTime: Date?
    let currentTime: Date
    let onBack: () -> Void
    let onFinishWork: () -> Void
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        VStack(spacing: 0) {
            CustomHeader(title: "Visit for John Doe", onBack: onBack)
            TabBar(activeTab: .constant(.info)) // Keep info tab active

            ScrollView {
                VStack(spacing: 15) {
                    
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
//                    CustomerInfoView()
                    JobScheduleView(workStartTime: workStartTime, currentTime: currentTime) // Pass work start and current time
//                    LineItemsView()
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
                    HStack{
                        Spacer()

                        Image(systemName: "play.circle.fill")
                            .font(.title3)
                            .foregroundColor(.black)
                            .imageScale(.small)
                        Text("\(timeDifferenceString(from: workStartTime, to: currentTime))")
                            .multilineTextAlignment(.leading)
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                        Spacer()
                            
                    }
                    
                    .background(Color.gray.opacity(0.4))
                    .cornerRadius(10)

                }

                Button(action: onFinishWork) {
                    Text("Finish Work")
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
    private func timeDifferenceString(from startTime: Date?, to endTime: Date) -> String {
           guard let startTime = startTime else { return "--:--:--" } // Changed default to match format
           let components = Calendar.current.dateComponents([.hour, .minute, .second], from: startTime, to: endTime)
           let hours = components.hour ?? 0
           let minutes = components.minute ?? 0
           let seconds = components.second ?? 0
           return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
       }
}
