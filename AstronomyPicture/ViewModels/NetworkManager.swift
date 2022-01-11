//
//  NetworkManager.swift
//  AstronomyPicture
//
//  Created by ramil on 11.01.2022.
//

import Foundation
import Combine
import SwiftUI

class NetworkManager: ObservableObject {
    
    @Published var date: Date = Date()
    
    @Published var photoInfo = PhotoInfo()
    @Published var image: UIImage? = nil
    
    private var subscription = Set<AnyCancellable>()
    
    init() {
        
        let url = URL(string: Constants.baseUrl)!
        _ = url.withQuery(["api_key" : Constants.key])!
        
        $date
            .removeDuplicates()
            .sink { (value) in
                self.image = nil
            }
            .store(in: &subscription)
        
        $date
            .removeDuplicates()
            .map {
                self.createUrl(for: $0)
            }
            .flatMap { (url) in
                URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .decode(type: PhotoInfo.self, decoder: JSONDecoder())
                    .catch { (error) in
                        Just(PhotoInfo())
                    }
            }
            .receive(on: RunLoop.main)
            .assign(to: \.photoInfo, on: self)
            .store(in: &subscription)
                
        $photoInfo
            .filter { $0.url != nil }
            .map { photoInfo -> URL in
                return photoInfo.url!
            }
            .flatMap { (url) in
                URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .catch( { error in
                        return Just(Data())
                    })
            }
            .map { (out) -> UIImage? in
                UIImage(data: out)
            }
            .receive(on: RunLoop.main)
            .assign(to: \.image, on: self)
            .store(in: &subscription)
    }
    
    func createUrl(for date: Date) -> URL {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        
        let url = URL(string: Constants.baseUrl)!
        let fullURL = url.withQuery(["api_key" : Constants.key, "date" : dateString])!
        
        return fullURL
    }
}
