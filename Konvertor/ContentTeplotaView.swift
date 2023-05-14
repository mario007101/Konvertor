//
//  ContentTeplotaView.swift
//  Konvertor
//
//  Created by Mário Markovič on 14/05/2023.
//

import SwiftUI

enum TeplotaHodnoty: String, CaseIterable{
    case c = "°C"
    case f = "°F"
    case k = "K"
}

struct ContentTeplotaView: View {
    @State private var zadanaTeplota: Double = 1
    @State private var vstupnaTeplota: TeplotaHodnoty = .c
    
    var vstupnaTeplotaC: Double {
        
        switch vstupnaTeplota {
        case .c:
            return zadanaTeplota
        case .f:
            return 5/9 * (zadanaTeplota - 32)
        case .k:
            return zadanaTeplota - 273.15
        }
    }
    
    var body: some View {
        Form {
            Section("Teplota v °C"){
                
                TextField("Vlož teplotu",value: $zadanaTeplota, format: .number)
                
                Picker("Vyber vstupnú teplotu", selection: $vstupnaTeplota){
                    
                    ForEach(TeplotaHodnoty.allCases, id: \.self){
                        Text($0.rawValue)
                    }
                    
                }
                .pickerStyle(.segmented)
            }
            
            Section("Teplotné jednotky"){
                ForEach(TeplotaHodnoty.allCases, id: \.self) { teplota in
                        let teplotaVypis = premen(vstupnaTeplotaC, output: TeplotaHodnoty(rawValue: teplota.rawValue)!)
                        Text("\(teplotaVypis) \(teplota.rawValue)")
                }
            }
        }
        .navigationTitle("Teplota")
    }
    
    func premen(_ vstup: Double, output: TeplotaHodnoty) -> Double {
        switch output {
        case .c:
            return vstup
        case .f:
            return  9/5 * vstup + 32
        case .k:
            return vstup + 273.15
        }
    }
}

struct ContentTeplotaView_Previews: PreviewProvider {
    static var previews: some View {
        ContentTeplotaView()
    }
}
