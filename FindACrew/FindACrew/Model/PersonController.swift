//
//  PersonController.swift
//  FindACrew
//
//  Created by Matthew Martindale on 3/12/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

class PersonController {
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    private let baseURL = URL(string: "https://swapi.co/api/people/")!
    
    func searchForPeopleWith(searchTerm: String, completion: @escaping ([Person]) -> Void) {
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        let searchTermQueryItem = URLQueryItem(name: "search", value: searchTerm)
        urlComponents?.queryItems = [searchTermQueryItem]
        
        guard let requestURL = urlComponents?.url else {
            print("Error: Request URL is nil")
            completion([Person]())
            return
        }
        
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.get.rawValue
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            guard error == nil else {
                print("Error fetching data: \(error!)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("Error: no data returned from data task.")
                completion([])
                return
            }
            
            let jsonDecoder = JSONDecoder()
            do {
                let personSearch = try jsonDecoder.decode(PersonSearch.self, from: data)
                completion(personSearch.results)
            } catch {
                print("Unable to decode data: \(error)")
                completion([])
            }
        }.resume()
    }
}
