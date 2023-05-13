//
//  ConvertHmotnostView.swift
//  Konvertor
//
//  Created by Mário Markovič on 13/05/2023.
//

import SwiftUI

enum Hmotnosti: String, CaseIterable {
    case tona = "t"
    case cent = "q"
    case kilo = "kg"
    case dekaGram = "dag"
    case gram = "g"
    case miliGram = "mg"
}

struct ConvertHmotnostView: View {
    @State private var zadanaHmotnost: Double = 1
    @State private var vstupnaHmotnost: Hmotnosti = .gram
    
    var vstupnaHmotnostKG: Double {
        switch vstupnaHmotnost {
        case .tona:
            return zadanaHmotnost * 1_000
        case .cent:
            return zadanaHmotnost * 100
        case .kilo:
            return zadanaHmotnost
        case .dekaGram:
            return zadanaHmotnost / 100
        case .gram:
            return zadanaHmotnost / 1_000
        case .miliGram:
            return zadanaHmotnost / 1_000_000
        }
    }
    
    var body: some View {
        Form {
            
            Section("Zadaj hmotnosť v kg"){
                TextField("Vlož hmotnosť", value: $zadanaHmotnost, format: .number)
            }
                        
            Section("Objemové jednotky") {
                ForEach(Hmotnosti.allCases, id: \.self){
                    let hmotnostVypis = premen(vstupnaHmotnostKG, output: Hmotnosti(rawValue: $0.rawValue)!)
                    Text("\(hmotnostVypis, specifier: "%.2f") \($0.rawValue)")
                }
            }
        }
        .navigationTitle("Hmotnosť")
    }
    
    func premen(_ vstup: Double, output: Hmotnosti) -> Double {
        switch output {
        case .tona:
            return zadanaHmotnost / 1_000
        case .cent:
            return zadanaHmotnost / 100
        case .kilo:
            return zadanaHmotnost
        case .dekaGram:
            return zadanaHmotnost * 100
        case .gram:
            return zadanaHmotnost * 1_000
        case .miliGram:
            return zadanaHmotnost * 1_000_000
        }
    }
}

struct ConvertHmotnostView_Previews: PreviewProvider {
    static var previews: some View {
        ConvertHmotnostView()
    }
}
