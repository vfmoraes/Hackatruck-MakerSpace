//
//  D2-Aula01.swift
//  Aula01-T2
//
//  Created by Student on 17/05/23.
//

import SwiftUI

struct D2_Aula01: View {
    var body: some View {
        VStack{
            Image("bg").resizable()
                .scaledToFit()
            Spacer()
            Image("bg").resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Text("Hackatruck")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .padding(.bottom, 150.0))
            Spacer()
            HStack{
                Text("Maker").font(.title)
                    .foregroundColor(.yellow)
                Text("Space")
                    .font(.title)
                    .foregroundColor(.red)
            }.padding(.all, 40.0)
            .background(Color(.black))
            
        }
        
    }
}

struct D2_Aula01_Previews: PreviewProvider {
    static var previews: some View {
        D2_Aula01()
    }
}
