//
//  CustomHeader.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import Foundation
import SwiftUI

// MARK: - Reusable UI Components
struct CardView<Content: View>: View {
    let title: String?
    let content: Content

    init(title: String? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let title = title {
                Text(title)
                    .font(.subheadline) // Smaller font for section titles
                    .fontWeight(.bold) // Bold for section titles
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 4) // Slight padding to align with content
            }
            content
        }
//        .padding(.top, title != nil ? 10 : 0) // Add top padding if there's a title
//        .padding(.bottom, 10)
        .background(Color.white)
//        .cornerRadius(10)
//        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
        .padding(.vertical, 5)
    }
}
