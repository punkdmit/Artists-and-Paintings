//
//  ArtistLoader.swift
//  myArtristry
//
//  Created by Dmitry Apenko on 06.07.2022.
//

import Foundation

class ArtistLoader {
    func loadArtists(result: @escaping (([Artist]) -> Void)) {
        
        guard let url = URL(string: "http://localhost:3000/artists") else { return }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            if let data = data {
                if let artists = try? JSONDecoder().decode([Artist].self, from: data) {
                    DispatchQueue.main.async {
                        result(artists)
                    }
                } else {
                    print("Invalid Response")
                }
            } else if let error = error {
                print(error)
            }
        }
        task.resume()
    }
}
