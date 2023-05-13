//
//  ContentView.swift
//  Konvertor
//
//  Created by Mário Markovič on 10/05/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink {
                    ConvertVzdialenostView()
                } label: {
                    LinkView(topColor: .blue, bottomColor: .cyan, headerTitle: "Vzdialenosť", titleImage: "imageKM")
                }
                
                NavigationLink {
                    ConvertObjemView()
                } label: {
                    LinkView(topColor: .orange, bottomColor: .yellow, headerTitle: "Objem", titleImage: "imageML")
                }
                
                NavigationLink {
                    ConvertHmotnostView()
                } label: {
                    LinkView(topColor: .green, bottomColor: .teal, headerTitle: "Hmotnosť", titleImage: "imageKG")
                }
            }
            
           // List{
           //     NavigationLink("Vzdialenosť", destination: ConvertVzdialenostView())
           //     NavigationLink("Objem", destination: ConvertObjemView())
           //}
            
            .navigationTitle("Konvertor")
        }
        
        //Len pre iPad
        //.navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}

