//
//  ContentView.swift
//  TipCalculator
//
//  Created by Maurice Baumann on 29.01.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var chechAmount = ""
    @State private var tipPercentage = 0
    @State private var numberOfFriends = 0
    
    var totalAfterTip: Double {
        let userTipSelection = (Double(tipPercentage) * 5) / 100
        let totalBill = Double(chechAmount) ?? 0
        
        let amountToPay = totalBill + (totalBill * userTipSelection)
        return amountToPay
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfFriends)
        let split = totalAfterTip/peopleCount
        return split
        
    }
    
    var body: some View {
        NavigationView{
            VStack {
                VStack {
                    Form {
                        Section{
                            Text("Rechnung")
                                .font(.system(size: 20))
                            TextField("Zuzahlende Rechnung", text: $chechAmount)
                                .keyboardType(.numbersAndPunctuation)
                        }
                        Section{
                            Picker(selection: $numberOfFriends, label: Text("Anzahl Personen")){
                                Text("1").tag(0)
                                Text("2").tag(1)
                                Text("3").tag(2)
                                Text("4").tag(3)
                                Text("5").tag(4)
                                Text("6").tag(5)
                                Text("7").tag(6)
                                Text("8").tag(7)
                                Text("9").tag(8)
                                Text("10").tag(9)
                            }
                        }
                        Section{
                            Text("Trinkgeld")
                            Picker(selection: $tipPercentage, label: Text(".")) {
                                Text("0%").tag(0)
                                Text("5%").tag(1)
                                Text("10%").tag(2)
                                Text("15%").tag(3)
                                Text("20%").tag(4)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        Section{
                            VStack(alignment: .leading){
                                Text("Rechnung Total \(totalAfterTip, specifier: "%.2f") €")
                                    .bold()
                                    .foregroundColor(.green)
                                    .font(.system(size: 20))
                                    .padding()
                                Text("Rechnung pro Person: \(totalPerPerson, specifier: "%.2f") €")
                                    .bold()
                                    .foregroundColor(.orange)
                                    .font(.system(size: 20))
                                    .padding()
                            }
                        }
                        Section{
                            Text("Bitte nur Zahlen oder Punkt für Centbeträge eingeben. Keine andere Zeichen o.ä.")
                                .foregroundColor(.blue)
                                .font(.system(size: 17))
                        }
                    }
                }
            }
            .navigationTitle("Trinkgeld Rechner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
