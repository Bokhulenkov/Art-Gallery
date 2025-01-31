//
//  NetworkService.swift
//  Art Gallery
//
//  Created by Alexander Bokhulenkov on 31.01.2025.
//

import Foundation

class NetworkService {
    let stringURL = "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json"
    let session = URLSession(configuration: .default)
    let decoder = JSONDecoder()
    
    func getArtists(completion: @escaping (Result<Artists, Error>) -> Void) {
        let url = URL(string: stringURL)
        guard let safeURL = url else {
            print("ошибка url")
            return
        }
        let urlRequest = URLRequest(url: safeURL)
        session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("We have \(error.localizedDescription)")
                completion(.failure(error))
            }
            do {
                guard let data = data else {
                    print("ошибка данных")
                    return
                }
                let artists = try self.decoder.decode(Artists.self, from: data)
                completion(.success(artists))
            } catch {
                print("ошибка данных \(error.localizedDescription)")
                completion(.failure(error))
            }
        }.resume()
    }
}
