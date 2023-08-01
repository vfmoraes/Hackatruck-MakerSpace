//
//  HomeView.swift
//  Aula03-T2
//
//  Created by Student on 19/05/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            ForEach(0..<21) {
                Text("Item \($0)")
            }
        }.scrollContentBackground(.hidden)
            .background(Color(.black))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
