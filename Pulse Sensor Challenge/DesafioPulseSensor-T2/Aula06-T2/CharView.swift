//
//  CharView.swift
//  Aula06-T2
//
//  Created by Student on 25/05/23.
//

import SwiftUI

struct CharView: View{
    
    var p: Pulso
    var body: some View{
        
        ZStack{
            AsyncImage(url: URL(string: "https://img.ibxk.com.br/2021/04/19/19165615261383.jpg?ims=704x"), content: {image in image.resizable()}, placeholder: {ProgressView()})
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 10)
            
            VStack{
                Text(p.pulse.description)
                    .foregroundColor(.white)
                    .bold()
                
                Spacer()
            }.padding(.top, 70)
                .ignoresSafeArea()
        }
    }
}
