//
//  ContentView.swift
//  Aula06-T2
//
//  Created by Student on 25/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        
        NavigationStack{
            VStack{
                AsyncImage(url: URL(string: "https://georgian.edu/wp-content/uploads/Health-Sciences-banner-1024x320.jpg"), content: {image in image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(Button(action: viewModel.clearData) {
                            Text("Recarregar")
                                .font(.largeTitle)
                        }).buttonStyle(.borderedProminent)
                }, placeholder: {ProgressView()}).ignoresSafeArea().frame(width: 250, height: 250)
                ScrollView{
                    Text("Pressão")
                        .font(.largeTitle)
                    ForEach(viewModel.chars, id: \.self._id){
                        p in
                        HStack{
                            Text(p.pulse.description)
                                .font(.title)
                                .multilineTextAlignment(.center)
                        }
                    }
                }
            }
            .foregroundColor(.white)
            .ignoresSafeArea()
            .background(Color("gri"))
        }.onAppear(){
            viewModel.fetch()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
