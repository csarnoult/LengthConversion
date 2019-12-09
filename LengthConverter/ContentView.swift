//
//  ContentView.swift
//  LengthConversion
//
//  Created by Chris Arnoult on 12/7/19.
//  Copyright © 2019 Chris Arnoult. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var originalUnit = 0
    @State private var newUnit = 0
    @State private var originalLength = ""
    let unitNames = ["meters", "kilometers", "feet", "yards", "miles"]
    
    var originalLengthInMeter : Double {
        switch String(originalUnit) {
        case "meter":
            return Double(originalLength) ?? 0
        case "kilometer":
            return (Double(originalLength) ?? 0) * 1000
        case "feet":
            return (Double(originalLength) ?? 0) / 0.3048
        case "yard":
            return (Double(originalLength) ?? 0) / 0.9144
        case "mile":
            return (Double(originalLength) ?? 0) * 1609.34
        default:
            return 0
        }
    }
    var newLength : Double {
        switch String(newUnit) {
        case "meter":
           return originalLengthInMeter
       case "kilometer":
           return originalLengthInMeter / 1000
       case "feet":
           return originalLengthInMeter * 0.3048
       case "yard":
           return originalLengthInMeter * 0.9144
       case "mile":
           return originalLengthInMeter / 1609.34
       default:
           return 0
        }
    }
    
    var convertUserInputIntoMillimeters: Double {
        let newUserLength = Double(originalLength) ?? 0
        let newUserLengthInMillimeters = newUserLength * 1000
        return newUserLengthInMillimeters
    }
     
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pick a unit")) {
                    Picker("Pick a unit to convert", selection: $originalUnit) {
                        ForEach(0 ..< unitNames.count) {
                            Text("\(self.unitNames[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Pick the converted unit")) {
                    Picker("Pick another unit", selection: $newUnit) {
                        ForEach(0 ..< unitNames.count) {
                            Text("\(self.unitNames[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Length")) {
                    TextField("Length", text: $originalLength)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Your converted length is...")) {
                    Text("\(newLength)")
                }
            }
        .navigationBarTitle("LengthConversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
