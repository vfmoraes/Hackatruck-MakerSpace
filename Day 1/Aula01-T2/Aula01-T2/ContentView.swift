//
//  ContentView.swift
//  Aula01-T2
//
//  Created by Student on 17/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("bg").resizable()
                .scaledToFit()
            Text("Hackatruck")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.blue)
            HStack{
                Text("Maker")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                Text("Space")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.red)
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
