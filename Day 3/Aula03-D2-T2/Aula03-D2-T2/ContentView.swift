//
//  ContentView.swift
//  Aula03-D2-T2
//
//  Created by Student on 19/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationStack{
                NavigationLink("Modo 1"){
                    Modo1()
                }
                NavigationLink("Modo 2"){
                    Modo2()
                }
                NavigationLink("Modo 3"){
                    Modo3()
                }
            }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
