//
//  DescricaoView.swift
//  Aula05-T2
//
//  Created by Student on 23/05/23.
//

import SwiftUI
import CoreLocation

struct DescricaoView: View {
    var informacoes: Location
    var body: some View {
        VStack{
            Text("\(informacoes.name)")
                .font(.title)
                .fontWeight(.bold)
            AsyncImage(url: URL(string: "\(informacoes.flag)")) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable().clipShape(Rectangle())
                        .frame(maxWidth: 80, maxHeight: 50).padding(.bottom, 30).padding(.top, 10)
                        .shadow(radius: 10)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            Text("\(informacoes.description)").padding()
            Spacer()
        }
        
    }
}

struct DescricaoView_Previews: PreviewProvider {
    static var previews: some View {
        DescricaoView(informacoes: Location(name: "", coordinate: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), flag: "", description: ""))
    }
}
