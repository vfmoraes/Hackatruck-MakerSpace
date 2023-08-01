//
//  ContentView.swift
//  Aula05-T2
//
//  Created by Student on 23/05/23.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let description: String
}

struct ContentView: View {
    @State private var showingSheet = false
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -15.817517, longitude: -47.968276), span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    @State private var cidadenome = "Brasil"
    let locations = [
        Location(name: "Belo Horizonte", coordinate: CLLocationCoordinate2D(latitude: -19.925726, longitude: -43.941218), flag: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9c/Bandeira-de-Belo-Horizonte.svg/1920px-Bandeira-de-Belo-Horizonte.svg.png", description: "Belo Horizonte é a capital do estado de Minas Gerais, no sudeste do Brasil. Rodeada de montanhas, a cidade é conhecida pelo enorme Estádio Mineirão. Construído em 1965, o estádio alberga também o Museu Brasileiro do Futebol. Nas proximidades encontra-se a Lagoa da Pampulha e o Conjunto Arquitetónico da Pampulha, que inclui a Igreja de São Francisco de Assis, cujo teto é ondulado e que foi concebida pelo arquiteto modernista brasileiro Oscar Niemeyer"),
        Location(name: "São Paulo", coordinate: CLLocationCoordinate2D(latitude: -23.567568, longitude:  -46.641376), flag: "https://www.saopauloinfoco.com.br/wp-content/uploads/2013/10/bandeira1.jpg", description: "São Paulo, centro financeiro do Brasil, está entre as cidades mais populosas do mundo, com diversas instituições culturais e uma rica tradição arquitetônica. Há prédios simbólicos como a catedral neogótica, o Edifício Martinelli, um arranha-céu inaugurado em 1929, e o Edifício Copan, com suas linhas curvas projetadas pelo arquiteto modernista Oscar Niemeyer. A igreja em estilo colonial do Pátio do Colégio marca o local onde os padres jesuítas fundaram a cidade em 1554."),
        Location(name: "Wagner", coordinate: CLLocationCoordinate2D(latitude: -12.282720, longitude: -41.169211), flag: "https://upload.wikimedia.org/wikipedia/commons/1/14/Bandeira_de_Wagner.jpg", description: "Wagner é um município brasileiro do estado da Bahia. Localiza-se na Chapada Diamantina. Sua população estimada em 2013 era de 9 504 habitantes. Possui uma área de 417,595 km² e é circunvizinhada pelos municípios: Ruy Barbosa, Lajedinho, Lençóis, Utinga e Bonito. O acesso principal se dá pela BR-242, seguindo depois ao norte pela a BA-142.")
    ]
    var body: some View {
        VStack {
            Text("World Map")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(cidadenome)
                .font(.title)
            Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    Circle()
                        .foregroundColor(.red)
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            showingSheet.toggle()
                        }.sheet(isPresented: $showingSheet) {
                            DescricaoView(informacoes: location)
                        }
                }
            }
            ScrollView(.horizontal){
                HStack{
                    ForEach(locations) { location in
                        Button("\(location.name)"){
                            mapRegion = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                            cidadenome = location.name
                        }.padding(.horizontal).buttonStyle(.borderedProminent).controlSize(.large)
                    }
                }
                
            }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
