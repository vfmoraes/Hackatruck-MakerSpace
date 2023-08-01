//
//  PhotosView.swift
//  Aula03-T2
//
//  Created by Student on 19/05/23.
//

import SwiftUI

struct PhotosView: View {
    
    private var ListaImagem = [
    "hare.fill",
    "tortoise.fill",
    "pawprint.fill",
    "ant.fill",
    "ladybug.fill"
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false){
            ZStack{
                Color.blue
                VStack{
                ForEach(ListaImagem, id: \.self) {
                    index in Image(systemName: "\(index)").font(.system(size:150)).padding()
                            }
                    }
            }
            
        }
    }
}

struct PhotosView_Previews: PreviewProvider {
    static var previews: some View {
        PhotosView()
    }
}
