//
//  ContentView.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import SwiftUI

// Screen 1: Info Tab Content
struct InfoScreen: View {
    @Binding var activeTab: VisitTab
    let onGoForVisit: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            CustomHeader(title: "Visit for Cristofer Saris") // Updated title
            TabBar(activeTab: $activeTab)

            ScrollView {
                VStack(alignment: .leading, spacing: 20) { // Increased spacing between sections
                    if activeTab == .info {
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
                    } else if activeTab == .note {
                        NoteContentView() // Call the new Note content view
                    } else if activeTab == .jobForms {
                        VisitScreen()// Reusing the existing forms view
                    } else if activeTab == .logs {
                        LogData()
                    }
                }
                .padding(.vertical) // Padding for the scrollable content
            }

            Spacer() // Pushes content to top

            
            Button(action: onGoForVisit) {
                           Text("Go for Visit")
                               .fontWeight(.bold)
                               .foregroundColor(.white)
                               .padding()
                               .frame(maxWidth: .infinity)
                               .background(Color.black)
                               .cornerRadius(8)
                       }
                       .padding(.horizontal)
        }
    }
}


// New Details Section View
struct DetailsSectionView: View {
    var body: some View {
        CardView(title: "Details") {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Phone Number")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Text("+1 (555) 555-5555")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    Divider()
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("Location")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        Button("Get Direction") {
                            print("Get Direction tapped")
                        }
                        .font(.body)
                        .foregroundColor(.blue)
                    }
                }

                VStack(alignment: .leading) {
                    Text("Job ID")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("JOB107082")
                        .font(.body)
                        .foregroundColor(.primary)
                }

                VStack(alignment: .leading) {
                    Text("Billing Address")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("112, Ocean Avenue, Amityville New York United States")
                        .font(.body)
                        .foregroundColor(.primary)
                }

                VStack(alignment: .leading) {
                    Text("Instructions")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("Thoroughly clean and sanitize assigned areas, ensuring all surfaces, floors, and fixtures are spotless and meet hygiene standards.")
                        .font(.body)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

// New Team Section View
struct TeamSectionView: View {
    var body: some View {
        CardView(title: "Team") {
            HStack {
                Button(action: {
                    print("Benjamin tapped")
                }) {
                    Text("Benjamin")
                        .font(.body)
                        .foregroundColor(.blue)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(5)
                }
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
    }
}

// Updated Line Items Section View for static data
struct LineItemsStaticView: View {
    var body: some View {
        CardView(title: "Line Items") {
            VStack(alignment: .leading, spacing: 8) {
                Text("Residential Cleaning")
                    .font(.body)
                    .fontWeight(.medium)
                    .foregroundColor(.primary)
                Text("Thoroughly clean and sanitize assigned areas, ensuring all")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
        }
    }
}


// Updated Job Schedule Section View for static data
struct JobScheduleStaticView: View {
    var body: some View {
        CardView(title: "Job Schedule") {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Starts")
                        .font(.body)
                        .foregroundColor(.primary)
                    Spacer()
                    Text("22 Jan 2025")
                        .font(.body)
                        .foregroundColor(.primary)
                    Text("4:00PM")
                        .font(.body)
                        .foregroundColor(.primary)
                }
                HStack {
                    Text("Ends")
                        .font(.body)
                        .foregroundColor(.primary)
                    Spacer()
                    Text("22 Jan 2025")
                        .font(.body)
                        .foregroundColor(.primary)
                    Text("5:00PM")
                        .font(.body)
                        .foregroundColor(.primary)
                }
            }
        }
    }
}

//// MARK: - Preview Provider (for Xcode Canvas)
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
