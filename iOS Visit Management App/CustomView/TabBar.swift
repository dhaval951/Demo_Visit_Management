//
//  CustomHeader.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import Foundation
import SwiftUI

// MARK: - Reusable UI Components

struct TabBar: View {
    @Binding var activeTab: VisitTab

    var body: some View {
        Divider()
            .foregroundColor(.gray)
        HStack(spacing: 0) { // Removed spacing to make tabs touch
            ForEach(VisitTab.allCases, id: \.self) { tab in
                Button(action: {
                    activeTab = tab
                }) {
                    Text(tab.rawValue)
                        .font(.subheadline)
                        .fontWeight(activeTab == tab ? .semibold : .regular) // Regular for inactive
                        .foregroundColor(activeTab == tab ? .blue : .gray)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12) // Adjust padding to match screenshot
                        .background(activeTab == tab ? Color.blue.opacity(0.1) : Color.clear) // Light blue background for selected
                        .cornerRadius(8) // Rounded corners for selected tab
                }
                .frame(maxWidth: .infinity) // Distribute tabs evenly
            }
        }
        .padding(.horizontal, 16) // Padding for the entire tab bar
        .padding(.vertical, 8)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
    }
}
