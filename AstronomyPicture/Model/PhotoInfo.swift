//
//  PhotoInfo.swift
//  AstronomyPicture
//
//  Created by ramil on 11.01.2022.
//

import Foundation

struct PhotoInfo: Codable {
    
    var title: String
    var description: String
    var url: URL?
    var copyright: String?
    var date: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "explanation"
        case url = "url"
        case copyright = "copyright"
        case date = "date"
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(URL.self, forKey: CodingKeys.url)
        self.copyright = try? valueContainer.decode(String.self, forKey: CodingKeys.copyright)
        self.date = try valueContainer.decode(String.self, forKey: CodingKeys.date)
    }
    
    init() {
        self.description = ""
        self.title = ""
        self.date = ""
    }
    
    static func createDefault() -> PhotoInfo {
        var photoInfo = PhotoInfo()
        
        photoInfo.title = "Orion's Belt Region in Gas and Dust"
        photoInfo.description = "You may have seen Orion's belt before -- but not like this. The three bright stars across this image are, from left to right, Mintaka, Alnilam, and Alnitak: the iconic belt stars of Orion. The rest of the stars in the frame have been digitally removed to highlight the surrounding clouds of glowing gas and dark dust. Some of these clouds have intriguing shapes, including the Horsehead and Flame Nebulas, both near Alnitak on the lower right.  This deep image, taken last month from the Marathon Skypark and Observatory in Marathon, Texas, USA, spans about 5 degrees, required about 20 hours of exposure, and was processed to reveal the gas and dust that we would really see if we were much closer. The famous Orion Nebula is off to the upper right of this colorful field.  The entire region lies only about 1,500 light-years distant and so is one of the closest and best studied star formation nurseries known.    Tonight: APOD Editor to Present the Best Space Images of 2021"
        photoInfo.date = "2022-01-11"
        
        return photoInfo
    }
}
