//
//  ContentView.swift
//  DatePickerInSwiftUI
//
//  Created by FCI on 06/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedDate: Date = Date()
    let startingDate: Date = Calendar.current.date(from: DateComponents(year: 2018)) ?? Date()
    let endingDate: Date = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    
    var body: some View {
        
        VStack {
            Text("SELECTED DATE IS:")
            Text(dateFormatter.string(from: selectedDate))
                .font(.title)
            //DatePicker("Select a Date", selection: $selectedDate)
            DatePicker("Select a date", selection: $selectedDate, displayedComponents: [.date, .hourAndMinute])
            //DatePicker("Select a date", selection: $selectedDate, in: startingDate...endingDate, displayedComponents: [.date])
                .tint(Color.red)
                .datePickerStyle(
                    //CompactDatePickerStyle()
                    GraphicalDatePickerStyle()
                    //WheelDatePickerStyle()
                )
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
