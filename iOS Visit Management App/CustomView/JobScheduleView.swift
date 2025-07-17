//
//  JobScheduleView.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import Foundation
import SwiftUI

// Existing Job Schedule Section View (Still used for dynamic steps)
struct JobScheduleView: View {
    var visitStartTime: Date? = nil
    var workStartTime: Date? = nil
    var currentTime: Date = Date()

    var body: some View {
        CardView(title: "Job Schedule") {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.gray)
                    Text("22 Jan 2025")
                }
                HStack {
                    Image(systemName: "clock")
                        .foregroundColor(.gray)
                    Text("2:00 PM")
                }
                if let visitStartTime = visitStartTime {
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.gray)
                        Text("Current: \(currentTime, formatter: DateFormatter.timeFormatter)")
                            .fontWeight(.semibold)
                    }
                }
                if let workStartTime = workStartTime {
                    HStack {
                        Image(systemName: "play.circle.fill")
                            .foregroundColor(.gray)
                        Text("Work Started: \(workStartTime, formatter: DateFormatter.timeFormatter)")
                            .fontWeight(.semibold)
                    }
                    HStack {
                        Image(systemName: "clock.fill")
                            .foregroundColor(.gray)
                        Text("Current: \(currentTime, formatter: DateFormatter.timeFormatter)")
                            .fontWeight(.semibold)
                    }
                }
            }
        }
    }
}

// Existing Line Items Section View (No longer used directly in InfoScreen, but kept for other screens if needed)
struct LineItemsView: View {
    var body: some View {
        CardView(title: "Line Items") {
            VStack(alignment: .leading) {
                Text("• Residential Cleaning")
                Text("• Window Washing")
            }
        }
    }
}

// Jobs Tab Content View (Still used for Jobs tab)
struct JobsContentView: View {
    var body: some View {
        CardView(title: "Job Description") {
            VStack(alignment: .leading, spacing: 15) {
                Text("Plywood countertop and relevant appliances require thorough cleaning and sanitization. Ensure all surfaces are spotless and free of debris.")
                    .foregroundColor(.secondary)

                // Placeholder for image upload
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                        .foregroundColor(.gray)
                        .frame(height: 100)
                        .background(Color.gray.opacity(0.1))

                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Text("Upload Image")
                            .foregroundColor(.gray)
                    }
                }
                .onTapGesture {
                    // Action to open image picker
                    print("Upload Image tapped")
                }
            }
        }
    }
}
