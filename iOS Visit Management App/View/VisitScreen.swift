//
//  ContentView.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//
import SwiftUI


struct VisitScreen: View {
    @State private var isDropdownOpen = false
    @State private var isChecked = false
    @State private var signaturePath = Path()
    @State private var signatureStartPoint: CGPoint?
    @GestureState private var dragOffset = CGSize.zero

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
        

            // Sample Authority with Always Visible Dropdown
            VStack(alignment: .leading, spacing: 5) {
                Button(action: { isDropdownOpen.toggle() }) {
                    HStack {
                        Text("Sample Authority to Proceed")
                            .font(.subheadline)
                        Image(systemName: isDropdownOpen ? "chevron.up" : "chevron.down")
                            .foregroundColor(.blue)
                        Spacer()

                        Image(systemName: "envelope")
                            .onTapGesture {
                                // Handle mail click
                                print("Mail icon clicked")
                            }
//                        Text("Mail")
//                        Spacer()
                        Image(systemName: "arrow.down")
                            .onTapGesture {
                                // Handle download click
                                print("Download icon clicked")
                            }
                    }
                }
                .foregroundColor(.blue)
                if isDropdownOpen {
                    HStack {
                       
                    }
                    .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)

            Divider()
                .background(Color.gray)
                .opacity(0.4)
            
            // Checkmark Session
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Check Box")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                    Toggle(isOn: $isChecked) {
                        
                    }
                    .toggleStyle(CheckboxToggleStyle())
//                    .padding(.horizontal)
                    
                }
                .padding(.horizontal)
            }

            // Site Contract
            VStack(alignment: .leading, spacing: 5) {
                Text("Site Contract")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text("The Client agrees to pay per service session.\nPayment is due")
                    .font(.body)
                    .foregroundColor(.black)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(5)
            }
            .padding(.horizontal)

            // Attachment with Click Event
            VStack(alignment: .leading, spacing: 5) {
                Text("Attachment")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Button(action: {
                    // Handle attachment click
                    print("Attachment clicked")
                }) {
                    HStack {
                        Image(systemName: "doc")
                        Text("POC test workflow.pdf")
                        Spacer()
                        Text("24.43KB")
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.black)
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(5)
                }
                Button(action: {
                    // Handle attachment click
                    print("Attachment clicked")
                }) {
                    HStack {
                        Image(systemName: "doc")
                        Text("Estimate.csv")
                            .foregroundColor(.red)
                        Spacer()
                        Text("Error")
                            .foregroundColor(.red)
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                    .foregroundColor(.black)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(5)
                }
            }
            .padding(.horizontal)

            // Signature with Draggable Drawing
            VStack(alignment: .leading, spacing: 5) {
                Text("Signature")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                ZStack {
                    Rectangle()
                        .frame(height: 100)
                        .border(Color.black, width: 1)
                    Path { path in
                        if let start = signatureStartPoint {
                            path.move(to: start)
                            path.addLine(to: CGPoint(x: start.x + dragOffset.width, y: start.y + dragOffset.height))
                        }
                    }
                    .stroke(Color.white, lineWidth: 2)
                }
                .contentShape(Rectangle())
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            if signatureStartPoint == nil {
                                signatureStartPoint = value.startLocation
                            }
                            let newPoint = value.location
                            signaturePath.addLine(to: newPoint)
                        }
                        .onEnded { _ in
                            signatureStartPoint = nil
                        }
                )
                .background(.gray)
                .opacity(0.2)
                .cornerRadius(20)

                Text("I give you authority to proceed with the work described")
                    .foregroundColor(.gray)
                Text("The Service Provider is not liable for pre-existing damages. Any damage caused during cleaning will be reported and resolved in good faith.")
                    .foregroundColor(.black)
                    .foregroundColor(.black)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(5)
            }
            .padding(.horizontal)

        }
        .background(Color(UIColor.systemBackground))
    }
}

// Custom Checkbox Toggle Style
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .foregroundColor(configuration.isOn ? .blue : .gray)
                .onTapGesture { configuration.isOn.toggle() }
            configuration.label
        }
    }
}

struct VisitScreen_Previews: PreviewProvider {
    static var previews: some View {
        VisitScreen()
    }
}
