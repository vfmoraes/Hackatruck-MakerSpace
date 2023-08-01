//
//  ContentView.swift
//  Aula02-T2
//
//  Created by Student on 18/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var peso: Float = 0
    @State private var altura: Float = 0
    @State private var resultado: Float = 0.00
    @State private var pesoString = ""
    @State private var alturaString = ""
    @State private var classificacao = ""
    @State private var cor = ""
    
    var body: some View {
        VStack {
            Text("Calculadora de IMC")
                .font(.title)
                .fontWeight(.medium)
                .padding(.bottom, 30.0)
            TextField("Digite seu peso", text: $pesoString)
                .padding([.leading, .bottom, .trailing], 15.0)
                .keyboardType(.decimalPad)
                .textContentType(.oneTimeCode)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Digite seu peso", text: $alturaString)
                .padding([.leading, .bottom, .trailing], 15.0)
                .keyboardType(.decimalPad)
                .textContentType(.oneTimeCode)
                .multilineTextAlignment(.center)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Calcular"){
                peso = Float(pesoString) ?? 0.0
                altura = Float(alturaString) ?? 0.0
                resultado = (peso)/pow(altura,2)
                if (resultado < 18.5){
                    classificacao = "Baixo peso"
                } else if (resultado < 24.99){
                    classificacao = "Normal"
                } else if (resultado < 29.99){
                    classificacao = "Sobrepeso"
                } else {
                    classificacao = "Obesidade"
                }
            }
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            Text(classificacao)
                .font(.largeTitle)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
                .padding(.top, 120.0)
            Spacer()
            Image("tabela-IMC").resizable().scaledToFit()
        }.background(Color(classificacao))
            .animation(.default, value: classificacao)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
