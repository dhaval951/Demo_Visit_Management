//
//  ContentView.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import SwiftUI
import SwiftUI
// New Note Content View
struct NoteContentView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            CardView(title: "Daily Visit Notes") {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Client requested additional cleaning in the kitchen area, specifically under the sink. Noted a minor leak in the bathroom faucet, informed the client to contact maintenance. All tasks completed as per schedule.")
                        .font(.body)
                        .foregroundColor(.primary)

//                    HStack {
//                        Text("Date:")
//                            .font(.caption)
//                            .foregroundColor(.secondary)
//                        Text("16 July 2025")
//                            .font(.body)
//                            .foregroundColor(.primary)
//                        Spacer()
//                    }

//                    HStack {
//                        Text("Author:")
//                            .font(.caption)
//                            .foregroundColor(.secondary)
//                        Text("Benjamin")
//                            .font(.body)
//                            .foregroundColor(.primary)
//                        Spacer()
//                    }
                }
            }

            // Site Photos Section added here
            CardView(title: "Site Photos") {
                VStack(alignment: .leading, spacing: 15) {
                    // Placeholder for image upload area
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(style: StrokeStyle(lineWidth: 2, dash: [5]))
                            .foregroundColor(.gray)
                            .frame(height: 100)
                            .background(Color.gray.opacity(0.1))

                        VStack {
                            Image(systemName: "photo.on.rectangle.angled") // System icon for photo
                                .font(.largeTitle)
                                .foregroundColor(.gray)
                            Text("Pick Photo") // Changed text to "Pick Photo"
                                .foregroundColor(.gray)
                        }
                    }
                    .onTapGesture {
                        // Action to open image picker (e.g., UIImagePickerController in a real app)
                        print("Pick Photo tapped for Site Photos in Note tab")
                    }
                }
            }
            Spacer()

//            // You can add more static note sections here if needed
//            CardView(title: "Follow-up Actions") {
//                VStack(alignment: .leading, spacing: 8) {
//                    Text("• Schedule plumber for faucet repair.")
//                        .font(.body)
//                        .foregroundColor(.primary)
//                    Text("• Send follow-up email to client regarding the leak.")
//                        .font(.body)
//                        .foregroundColor(.primary)
//                }
//            }
        }
    }
}
// MARK: - Preview Provider (for Xcode Canvas)

struct NoteContentView_Previews: PreviewProvider {
    static var previews: some View {
        NoteContentView()
    }
}
