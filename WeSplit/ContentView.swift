//
//  ContentView.swift
//  WeSplit
//
//  Created by MD Tanvir Alam on 30/8/20.
//  Copyright © 2020 MD Tanvir Alam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var people = 2
    @State private var tipPercentage = 2
    var tipPercentages = [0,10,15,20,25]
    var totalPerPerson : Double {
        // calcutaion
        let peopleCount = Double(people)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = (tipSelection * orderAmount) / 100
        let grandTotal = orderAmount + tipValue
        let perPerson = grandTotal / peopleCount
        return perPerson
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection: $people){
                        ForEach(0..<100){
                            Text("\($0) number of people")
                        }
                    }
                }
                
                Section(header: Text("How much tip do you want to give?")){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(0..<tipPercentages.count){
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section{
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
