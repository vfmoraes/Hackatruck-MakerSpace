//
//  ViewModel.swift
//  Aula06-T2
//
//  Created by Student on 25/05/23.
//

import Foundation

struct Pulso: Codable {
    let _id: String?
    let _rev: String?
    let Name: String?
    let pulse: Int
}

class ViewModel: ObservableObject {
    
    @Published var chars : [Pulso] = []
    
    func clearData() {
        chars.removeAll()
    }
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/get") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let parsed = try JSONDecoder().decode([Pulso].self, from: data)
                DispatchQueue.main.async {
                    self?.chars = parsed
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            self.fetch()
        }
    }
}



