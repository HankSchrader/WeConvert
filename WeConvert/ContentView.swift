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
    let meterToKm = 1000
    @State private var inputDistance = ""
    @State private var inputMeasurment = 1
    @State private var outputMeasure = 1
    let measurementOptions: [String] = ["Kilometer", "Meteres", "Miles", "Feet",]
    let measurementOptionsOutput: [String] = ["Kilometer", "Meteres", "Miles", "Feet"]
//
//    let output = {
//        switch(inputMeasurment) {
//        case 0:
//            switch(inputMeasurment)
//        }
//    }
    
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
                    
                    
                    Picker(selection: $outputMeasure, label: Text("")) {
                        ForEach(0..<measurementOptionsOutput.count) {
                            Text("\(self.measurementOptions[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                
                    Text("\(output)")
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
