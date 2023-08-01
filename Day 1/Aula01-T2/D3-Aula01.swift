//
//  D3-Aula01.swift
//  Aula01-T2
//
//  Created by Student on 17/05/23.
//

import SwiftUI

struct D3_Aula01: View {
    @State private var showingAlert = false
    @State private var nameEntry = "Fulano"
    
    var body: some View {
        ZStack{
            Image("bg").resizable()
                .aspectRatio(1/1, contentMode: .fill)
                .opacity(0.2)
                .blur(radius: 5.0)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Bem vindo, \(nameEntry)!")
                    .font(.title)
                TextField("Escreva seu nome", text:$nameEntry)
                    .multilineTextAlignment(.center)
                Spacer()
                ZStack{
                    VStack{
                        Image("logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 100)
                        Image("truck")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300.0, height: 100.0).scaledToFit()
                    }
                }
                
                Spacer()
                Button("Entrar")
                {
                    showingAlert = true
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("ALERTA !"), message: Text("Você irá iniciar o desafio da aula agora"), dismissButton: .default(Text("Vamos lá!")))
                }
                
            }
        }
    }
}

struct D3_Aula01_Previews: PreviewProvider {
    static var previews: some View {
        D3_Aula01()
    }
}
