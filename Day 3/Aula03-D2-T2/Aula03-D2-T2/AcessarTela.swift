//
//  AcessarTela.swift
//  Aula03-D2-T2
//
//  Created by Student on 19/05/23.
//

import SwiftUI

struct AcessarTela: View {
    var nameEntry: String
    var body: some View {
        Text("Volte, \(nameEntry)")
    }
}

struct AcessarTela_Previews: PreviewProvider {
    static var previews: some View {
        AcessarTela(nameEntry: "")
    }
}
