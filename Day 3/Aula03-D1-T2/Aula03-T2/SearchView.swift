//
//  SearchView.swift
//  Aula03-T2
//
//  Created by Student on 19/05/23.
//

import SwiftUI

struct SearchView: View {
    var body: some View {
        ZStack{
            Color.green
            Rectangle().foregroundColor(.blue)
            .frame(width: 300.0, height: 300.0)
            .overlay(Text("Hello, Hackatruck"))
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
