//
//  ContentView.swift
//  Aula04-T2
//
//  Created by Student on 22/05/23.
//

import SwiftUI

struct Musica: Identifiable {
    var id: Int
    var nome: String
    var artista: String
    var capa: String
}

struct ContentView: View {
    var ArrayMusicas = [
        Musica(id: 1, nome: "KO", artista: "Pabllo Vittar", capa: "https://i.scdn.co/image/ab67616d0000b273519946b0bd601865f8c7def2"),
        Musica(id: 2, nome: "Had Enough", artista: "Seafret", capa: "https://i.scdn.co/image/ab67616d0000b273ca05847b72d4851f2333b56e"),
        Musica(id: 3, nome: "Can You Feel My Heart", artista: "Bring Me The Horizon", capa: "https://i.scdn.co/image/ab67616d0000b27360cf7c8dd93815ccd6cb4830"),
        Musica(id: 4, nome: "Int the End", artista: "Linkin Park", capa: "https://i.scdn.co/image/ab67616d0000b273e2f039481babe23658fc719a"),
        Musica(id: 5, nome: "Bring Me To Life", artista: "Evanescence", capa: "https://i.scdn.co/image/ab67616d0000b27325f49ab23f0ec6332efef432"),
        Musica(id: 6, nome: "Aos Poucos", artista: "Supercombo", capa: "https://i.scdn.co/image/ab67616d00001e0236aa14c95770365a86ca7c9d"),
        Musica(id: 7, nome: "Lavender Haze", artista: "Taylor Swift", capa: "https://i.scdn.co/image/ab67616d0000b273bb54dde68cd23e2a268ae0f5"),
        Musica(id: 8, nome: "Set Me Free Pt.2", artista: "Jimin", capa: "https://i.scdn.co/image/ab67616d0000b2734f4ec2c2a865569bd4a067a4"),
        Musica(id: 9, nome: "The WORLD", artista: "Nightmare", capa: "https://i.scdn.co/image/ab67616d0000b2731bfa1a433edde0dedb26e0b7"),
        Musica(id: 10, nome: "Sahara", artista: "Hensonn", capa: "https://i.scdn.co/image/ab67616d0000b27383bd1e120f8b14407fe73816")
        
    ]
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: .init(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false){
                    VStack {
                        AsyncImage(url: URL(string: "https://scontent.fplu8-1.fna.fbcdn.net/v/t39.30808-6/298538957_489455429848754_8338744740369789501_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=e3f864&_nc_ohc=58X5O9wTbAkAX-gPwSL&_nc_ht=scontent.fplu8-1.fna&oh=00_AfB7sGF7JXejJsgiTvqQkjR0EewxlAumjCxPOWcc3qezKQ&oe=647046D7")) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image.resizable().clipShape(Rectangle())
                                    .frame(maxWidth: 250, maxHeight: 250).padding(.bottom, 30).padding(.top, 30)
                            case .failure:
                                Image(systemName: "photo")
                            @unknown default:
                                EmptyView()
                            }
                            VStack{
                                HStack{
                                    Text("HackaFM")
                                        .foregroundColor(.white)
                                        .font(.title)
                                        .padding(.leading)
                                    Spacer()
                                }
                            }
                            HStack{
                                AsyncImage(url: URL(string: "https://scontent.fplu8-1.fna.fbcdn.net/v/t39.30808-6/298538957_489455429848754_8338744740369789501_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=e3f864&_nc_ohc=58X5O9wTbAkAX-gPwSL&_nc_ht=scontent.fplu8-1.fna&oh=00_AfB7sGF7JXejJsgiTvqQkjR0EewxlAumjCxPOWcc3qezKQ&oe=647046D7"), scale: 25.0)
                                    .padding([.leading, .bottom])
                                Text("Hackasong").font(.subheadline).foregroundColor(.white).padding(.bottom)
                                Spacer()
                            }
                            ForEach(ArrayMusicas) { Musica in
                                HStack{
                                    NavigationLink(destination: MusicaView(musica: Musica)){
                                        AsyncImage(url: URL(string: "\(Musica.capa)")) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image.resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(maxWidth: 50, maxHeight: 50)
                                            case .failure:
                                                Image(systemName: "photo")
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                    }
                                    VStack{
                                        NavigationLink(destination: MusicaView(musica: Musica)){
                                            Text("\(Musica.nome)")
                                                .font(.headline)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .foregroundColor(.white)
                                                .overlay(Text("...")
                                                    .foregroundColor(.white)
                                                    .font(.system(size: 30.0))
                                                    .padding(.trailing)
                                                    .frame(maxWidth: .infinity, alignment: .trailing))
                                        }
                                        NavigationLink(destination: MusicaView(musica: Musica)){
                                            Text("\(Musica.artista)").font(.caption).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        
                                    }
                                }.padding(.bottom, 10.0)
                                    .padding(.leading, 15.0)
                            }
                            Text("Sugeridos").font(.title).foregroundColor(.white).padding(.top, 100.0).frame(maxWidth: .infinity, alignment: .leading)
                            ScrollView(.horizontal){
                                HStack{
                                    VStack{
                                        AsyncImage(url: URL(string: "https://www.eusemfronteiras.com.br/wp-content/uploads/2020/09/shutterstock_1890767740-810x456.jpg")) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image.resizable().clipShape(Rectangle())
                                                    .frame(maxWidth: 200, maxHeight: 200).padding(.bottom, 30).padding(.top, 10)
                                            case .failure:
                                                Image(systemName: "photo")
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                        Text("Exemplo 1")
                                            .foregroundColor(Color.white)
                                    }
                                    VStack{
                                        AsyncImage(url: URL(string: "https://www.eusemfronteiras.com.br/wp-content/uploads/2020/09/shutterstock_1890767737-810x456.jpg")) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image.resizable().clipShape(Rectangle())
                                                    .frame(maxWidth: 200, maxHeight: 200).padding(.bottom, 30).padding(.top, 10)
                                            case .failure:
                                                Image(systemName: "photo")
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                        Text("Exemplo 2")
                                            .foregroundColor(Color.white)
                                    }
                                    VStack{
                                        AsyncImage(url: URL(string: "https://telhanorte.vteximg.com.br/arquivos/ids/338308-NaN-NaN/Numero-3-de-aco-com-bucha-e-parafuso-145cm-preto-Bemfixa.jpg?v=636868970281500000")) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                            case .success(let image):
                                                image.resizable().clipShape(Rectangle())
                                                    .frame(maxWidth: 200, maxHeight: 200).padding(.bottom, 30).padding(.top, 10)
                                            case .failure:
                                                Image(systemName: "photo")
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                        Text("Exemplo 3")
                                            .foregroundColor(Color.white)
                                    }
                                }
                            }
                        }
                        
                    }
                }
            }
        }.accentColor(.white)
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
