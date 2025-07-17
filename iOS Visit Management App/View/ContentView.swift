//
//  ContentView.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import SwiftUI
import SwiftData

// MARK: - Main Content View (Handles Navigation)
struct ContentView: View {
    //same like userdefault save
    @AppStorage("savedTime") private var savedTime: String = ""
    @AppStorage("endTime") private var endTime: String = ""

    // saving in swiftData
    @Environment(\.modelContext) private var modelContext

    
    @State private var currentStep: VisitStep = .info // Controls the main flow
    @State private var activeTab: VisitTab = .info // Controls tabs within the info screen
    @State private var visitStartTime: Date? = nil
    @State private var workStartTime: Date? = nil
    @State private var currentTime: Date = Date() // Still needed for other steps, but not for static Info tab

    // Timer for updating current time (only active if needed for other steps)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationStack { // Use NavigationStack for modern iOS navigation
            VStack(spacing: 0) {
                // Render the appropriate view based on the current step
                switch currentStep {
                case .info:
                    InfoScreen(
                        activeTab: $activeTab,
                        onGoForVisit: { currentStep = .goForVisit }
                    )
                case .goForVisit:
                    GoForVisitScreen(
                        onBack: { currentStep = .info },
                        onReachedDestination: {
                            visitStartTime = Date() // Record time when destination is reached
                            currentStep = .reachedDestination
                        }
                    )
                case .reachedDestination:
                    ReachedDestinationScreen(
                        visitStartTime: visitStartTime,
                        currentTime: currentTime,
                        onBack: { currentStep = .goForVisit },
                        onStartWork: {
                            workStartTime = Date() // Record time when work starts
                            currentStep = .startWork
                        }
                    )
                case .startWork:
                    StartWorkScreen(
                        workStartTime: workStartTime,
                        currentTime: currentTime,
                        onBack: { currentStep = .reachedDestination },
                        onFinishWork: {
                            // In a real app, this would trigger a completion process
                            print("Work Finished!")
                            // Optionally navigate back to info or a summary screen
                            
                            let formatter = DateFormatter()
                            formatter.dateFormat = "HH:mm:ss" // Customize the format as needed
                            savedTime = formatter.string(from: workStartTime ?? Date())
                            endTime = formatter.string(from: currentTime)
                            
                            let newData = MyData(string1: savedTime, string2: endTime)
                            modelContext.insert(newData)
                            
                            currentStep = .info
                        }
                    )
                }
            }
            .onReceive(timer) { input in
                // Update current time every second
                // This is only relevant for ReachedDestinationScreen and StartWorkScreen
                if currentStep == .reachedDestination || currentStep == .startWork {
                    currentTime = input
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.white)) // Light gray background
            .navigationBarHidden(true) // Hide default navigation bar to use custom header
        }
        
    }
}


// MARK: - Preview Provider (for Xcode Canvas)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .modelContainer(for: MyData.self)

    }
}
