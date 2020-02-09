//
//  ContentView.swift
//  WeConvert
//
//  Created by Erik Nicole Mikac on 2/6/20.
//  Copyright © 2020 Erik Mikac. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let feetToMile = 5280
    let feetToKm = 3280.84
    let meterToKm = 1000.0
    let KmToMile = 0.621371
    let meterToMile = 0.000621371
    let meterToFeet = 3.28084
    let mileToKm = 1.60934
    let milesToMeters = 0.000621371
    let kmToFeet = 0.0003048
    let feetToMeter = 0.3048
    @State private var inputDistance = ""
    @State private var inputMeasurment = 1
    @State private var outputMeasurment = 1
    let measurementOptions: [String] = ["Kilometer", "Meteres", "Miles", "Feet",]
    let measurementOptionsOutput: [String] = ["Kilometer", "Meteres", "Miles", "Feet"]
// Text("$\(totalPerPerson, specifier: "%.2f")")
    var output: Text {
        var finalOutput: Double = 0
         let inputDistanceInt = Int(inputDistance) ?? 0
        switch self.inputMeasurment {
        case 0:
             // KM to something
            if(self.outputMeasurment == 0) {
                finalOutput = Double(inputDistanceInt)
            } else if (self.outputMeasurment == 1) {
                finalOutput =  Double(inputDistanceInt) * meterToKm
            } else if (self.outputMeasurment == 2) {
                finalOutput =  Double(inputDistanceInt) * KmToMile
            } else {
                finalOutput =  Double(inputDistanceInt) * feetToKm
            }
        case 1:
            // Meter To something
            if(self.outputMeasurment == 0) {
                finalOutput =  Double(inputDistanceInt) / meterToKm
             } else if (self.outputMeasurment == 1) {
                finalOutput =  Double(inputDistanceInt)
             } else if (self.outputMeasurment == 2) {
                finalOutput =  Double(inputDistanceInt) * meterToMile
             } else {
                 finalOutput =  Double(inputDistanceInt) * meterToFeet
             }
        case 2:
            // Miles to something
            if(self.outputMeasurment == 0) {
                finalOutput =  Double(inputDistanceInt) * feetToKm
             } else if (self.outputMeasurment == 1) {
                finalOutput =  Double(inputDistanceInt) * milesToMeters
             } else if (self.outputMeasurment == 2) {
                finalOutput =  Double(inputDistanceInt)
             } else {
                finalOutput =  Double(inputDistanceInt) * Double(feetToMile)
             }
        case 3:
            // Feet to something
            if(self.outputMeasurment == 0) {
                finalOutput =  Double(inputDistanceInt) * kmToFeet
             } else if (self.outputMeasurment == 1) {
                finalOutput =  Double(inputDistanceInt) * Double(feetToMeter)
             } else if (self.outputMeasurment == 2) {
                finalOutput =  Double(inputDistanceInt) / Double(feetToMile)
             } else {
                finalOutput =  Double(inputDistanceInt)
             }
        default:
            finalOutput =  -1
        }
        if (finalOutput - finalOutput.rounded() != 0) {
            return Text("\(finalOutput, specifier: "%.3f")")
        }
        return Text("\(Int(finalOutput))")
    
   
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    Picker(selection: $inputMeasurment, label: Text("") ) {
                        ForEach(0..<measurementOptions.count) {
                             Text("\(self.measurementOptions[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    TextField("Input disance", text: $inputDistance)
                        .keyboardType(.decimalPad)
                    
                    
                    Picker(selection: $outputMeasurment, label: Text("")) {
                        ForEach(0..<measurementOptionsOutput.count) {
                            Text("\(self.measurementOptionsOutput[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                
                    output
                }
                
            }.navigationBarTitle("WeConvert")

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
