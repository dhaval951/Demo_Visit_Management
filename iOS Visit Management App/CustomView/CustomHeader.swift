//
//  CustomHeader.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import Foundation
import SwiftUI

// MARK: - Reusable UI Components

struct CustomHeader: View {
    let title: String
    var onBack: (() -> Void)?

    var body: some View {
        HStack {
            if let onBack = onBack {
                Button(action: onBack) {
//                    Button(action: {}) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.black) // Changed to black to match screenshot
                }
            }
            Spacer()
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            Spacer()
            Button(action: {
                // Action for more options
                print("More options tapped")
            }) {
                Image(systemName: "ellipsis.circle") // Using a system icon for more options
                    .font(.title2)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
    }
}
