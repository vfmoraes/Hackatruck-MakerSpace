//
//  ContentView.swift
//  Aula03-T2
//
//  Created by Student on 19/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            HomeView()
                .badge(2)
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            SearchView()
                .tabItem{
                    Label("",systemImage:"magnifyingglass")
                }
            PhotosView()
                .tabItem{
                    Label("Photos", systemImage: "photo")
                }
            MessagesView()
                .badge("!")
                .tabItem{
                    Label("Messages",systemImage: "message")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
