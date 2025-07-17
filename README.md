
# Visit Management Application

## Overview
This is a SwiftUI-based iOS application designed to manage visit-related tasks for service providers. It facilitates visit scheduling, job form management, and status tracking with a tabbed interface for easy navigation.

### Purpose
The application aims to streamline visit planning, display client information, manage job forms, track logs, and provide detailed status updates for service industry users.

### Scope
The app supports visit authorization, client details, job form handling, log tracking, and status updates, targeting service personnel on iOS devices.

## Features
### User Interface
- **Tabs**: Includes "Visit," "Info," "Job Forms," "Logs," and "Details" sections for navigation.
- **Layout**: Matches the design from provided mockups with headers, dividers, and buttons.

### Key Functionalities
- **Visit Authorization**: Dropdown for "Sample Authority to Proceed" with mail and download icons, checkbox session toggle, and a draggable signature area.
- **Client Information**: Displays phone number, job ID, address, instructions, team, and schedule.
- **Job Forms**: Manages site contracts, payment terms, and file attachments with error handling.
- **Status Tracking**: Supports buttons like "Go for Visit," "Cancel Visit," "Reached Destination," "Start Work," and "Finish Work" based on visit state.
- **Signature Capture**: Allows drawing a digital signature on the Visit screen.

### Figma Design
<img width="1434" height="496" alt="Screenshot 2025-07-16 at 4 32 09 PM" src="https://github.com/user-attachments/assets/a4888087-d9eb-47ef-9e5a-f2cc2d363027" />

### User Interactions
- Toggle dropdown visibility for authority details.
- Click mail and download icons for actions.
- Check or uncheck the session toggle.
- Draw a signature in the designated area.
- Navigate between tabs and trigger state-based button actions.

## Installation
### Requirements
- **Platform**: iOS 17.0 and above.
- **Tools**: Xcode 15+ with SwiftUI support.
- **Dependencies**: SwiftData for local persistence (included with iOS 17+).

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/visit-management-app.git

2.  Open the project in Xcode:
     open VisitManagementApp.xcodeproj
3.  Build and run the app on an iOS simulator or device.


## Technical Details
### Development Environment
- Built with Xcode 15+ and SwiftUI.
- Uses SwiftData for local data storage with entities(e.g., Mydata model).
- Save data just Start Time and end time as Mydata model.

### Dependencies
- SwiftData (built-in with iOS 17+).
- No external image files; uses system icons.

###  Acceptance Criteria
- All tabs load with content matching the mockups.
- Dropdown, checkbox, and signature features work as expected.
- Button actions update the UI state (e.g., "Go for Visit" to "Reached Destination").
- App passes iOS simulator testing without crashes.

###  Deliverables
- Complete SwiftUI source code.
- Compiled iOS application package (.ipa).
- This README.md file.

### Contributing
- Fork the repository, create a feature branch, commit your changes, and submit a pull request. Ensure code follows Swift best practices.

### License
- MIT License - Feel free to modify and distribute, but check the license file for details.

### Version
- Version: 1.0
- Date: July 17, 2025
- Time: 09:33 AM IST
