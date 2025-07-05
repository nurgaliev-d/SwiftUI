//
//  ContentView.swift
//  WeSplit
//
//  Created by Диас Нургалиев on 04.07.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = 0.0
    @State private var numberOfPeolpe = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeolpe + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = amount / 100 * tipSelection
        let grandTotal = amount + tipValue
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Check amount",value: $amount, format: .currency(code: "KZT"))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeolpe) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                    Section {
                        Picker("Tip percentage", selection: $tipPercentage) {
                            ForEach(tipPercentages, id: \.self) {
                                Text("\($0)%")
                            }
                        }
                        .pickerStyle(.segmented)
                    } header: {
                        Text("How much tip do you want to leave?")
                    }
                Section {
                    Text(totalPerPerson, format: .currency(code: "KZT"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
