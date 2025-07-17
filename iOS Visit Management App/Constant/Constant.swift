//
//  Constant.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import Foundation

// MARK: - Enums for Navigation and Tabs

enum VisitStep {
    case info
    case goForVisit
    case reachedDestination
    case startWork
}

enum VisitTab: String, CaseIterable {
    case info = "Info"
    case note = "Note"
    case jobForms = "Job Forms"
    case logs = "Logs"
}
