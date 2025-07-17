//
//  LogData.swift
//  iOS Visit Management App
//
//  Created by Dhaval Bhadania on 16/07/25.
//

import Foundation
import SwiftUI
import SwiftData

struct LogData: View {
    
   
    @AppStorage("savedTime") private var savedTime: String = ""
    @AppStorage("endTime") private var endTime: String = ""

    @State private var displayDate: Date?
    @State private var enddisplayDate: Date?
    
    @Query private var myDataItems: [MyData]
    @State private var showdata: Bool = false
    
    var body: some View {
     
        
        VStack {
            Button("Load") {
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm:ss"
                if let date = formatter.date(from: savedTime) {
                    displayDate = date
                } else {
                    displayDate = nil
                }
                if let date = formatter.date(from: endTime) {
                    enddisplayDate = date
                } else {
                    enddisplayDate = nil
                }
                showdata = true
            }
            
            if let enddisplayDate = enddisplayDate{
                VStack{
                    Text("Work Time: \(displayDate!, formatter: dateFormatter)")
                    Text("Work Finished Time: \(enddisplayDate, formatter: dateFormatter)")
                    
                    if(showdata)
                    {
                        ForEach(myDataItems) { item in
                            VStack() {
                                Text("Work Time in loop: \(item.string1)")
                                Text("Work Finished Time in loop:: \(item.string2)")
                            }
                        }
                        .frame(maxWidth: .infinity,maxHeight: .infinity)
                    }
                    Spacer()
                }
            } else {
                ZStack{
                    Text("Logs content goes here.")
                }
            }

        }
        .frame(maxHeight: .infinity)
    }
    
   
    private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm:ss"
            return formatter
        }
}



#Preview {
    LogData()
        .modelContainer(for: MyData.self)
}
