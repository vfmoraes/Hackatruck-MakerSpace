//
//  Modo2.swift
//  Aula03-D2-T2
//
//  Created by Student on 19/05/23.
//

import SwiftUI

struct Modo2: View {
@State var nameEntry = ""
    var body: some View {
        VStack{
            TextField("Escreva seu nome", text: $nameEntry)
            Text("Estamos percorrendo um caminho, \(nameEntry)")
            NavigationLink("Acessar a tela", destination: AcessarTela(nameEntry: nameEntry))
        }
    }
}

struct Modo2_Previews: PreviewProvider {
    static var previews: some View {
        Modo2()
    }
}
