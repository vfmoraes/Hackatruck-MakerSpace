//
//  MusicaView.swift
//  Aula04-T2
//
//  Created by Student on 22/05/23.
//

import SwiftUI

struct MusicaView: View {
    @State private var speed = 0.0
    @State private var isEditing = false
    @State var play = false
    var musica: Musica
    var body: some View {
        ZStack{
            LinearGradient(gradient: .init(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            Spacer()
            
            VStack{
                VStack{
                    AsyncImage(url: URL(string: "\(musica.capa)")) { phase in
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
                    }
                    .padding(.top, 50.0)
                }
                
                
                VStack{
                    Text("\(musica.nome)")
                        .font(.title2)
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                    
                    Text("\(musica.artista)").font(.title3).fontWeight(.regular).foregroundColor(.white)
                    Spacer()
                    VStack {
                            Slider(
                                value: $speed,
                                in: 0...100,
                                onEditingChanged: { editing in
                                    isEditing = editing
                                }
                            )
                                .foregroundColor(isEditing ? .red : .blue)
                                .accentColor(.white)
                    }.padding([.leading, .bottom, .trailing], 25.0)
                    HStack{
                        Image(systemName: "shuffle").foregroundColor(.white).font(.system(size: 30))
                        Spacer()
                        Image(systemName: "backward.end.fill").foregroundColor(.white).font(.system(size: 30))
                        Button{
                            play.toggle()
                        } label: {
                            Image(systemName: play ?  "play.fill": "pause.fill" ).foregroundColor(.white).padding(.horizontal, 35.0).font(.system(size: 50))
                        }
                        
                        Image(systemName: "forward.end.fill").foregroundColor(.white).font(.system(size: 30))
                        Spacer()
                        Image(systemName: "repeat").foregroundColor(.white).font(.system(size: 30))
                    }
                    .padding(.horizontal, 30.0)
                    .padding(.bottom,200)
                }
            }
        }
    }
}

struct MusicaView_Previews: PreviewProvider {
    static var previews: some View {
        MusicaView(musica: Musica(id: 0, nome: "", artista: "", capa: ""))
    }
}
