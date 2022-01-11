//
//  NetworkManager.swift
//  AstronomyPicture
//
//  Created by ramil on 11.01.2022.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    
    private var subscription = Set<AnyCancellable>()
    
    init() {
        
        let url = URL(string: Constants.baseUrl)!
        
        let fullURL = url.withQuery(["api_key" : Constants.key])!
        
        URLSession.shared.dataTaskPublisher(for: fullURL)
            .sink(receiveCompletion: { (completion) in
                switch completion {
                case .finished:
                    print("fetch complete finished")
                case .failure(let failure):
                print("fetch complete with failure: \(failure)")
                }
            }) { (data, response) in
                if let description = String(data: data, encoding: .utf8) {
                    print("fetch new data \(description)")
                }
            }.store(in: &subscription)
        
    }
}
