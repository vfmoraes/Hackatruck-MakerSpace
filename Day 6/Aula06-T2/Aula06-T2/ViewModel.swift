//
//  ViewModel.swift
//  Aula06-T2
//
//  Created by Student on 25/05/23.
//

import Foundation

struct Wand: Codable{
    
    let wood: String?
    let core: String?
    let length: Double?
}

struct HaPo: Codable, Identifiable{
    
    let id: String
    let name: String?
    let alternate_names: [String]?
    let species: String?
    let gender: String?
    let house: String?
    let dateOfBirth: String?
    let yearOfBirth: Int?
    let wizard: Bool?
    let ancestry: String?
    let eyeColour: String?
    let hairColour: String?
    let wand: Wand
    let patronus: String?
    let hogwartsStudent: Bool?
    let hogwartsStaff: Bool?
    let actor: String?
    let alternate_actor: String?
    let alive: Bool?
    let image: String?
}

class ViewModel: ObservableObject {
    
    @Published var chars : [HaPo] = []
    
    func fetch(){
        
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/Gryffindor")
                
        else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){[weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let parsed = try JSONDecoder().decode([HaPo].self, from: data)
                DispatchQueue.main.async {
                    self?.chars = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}


