//
//  PictureOfTheDayView.swift
//  AstronomyPicture
//
//  Created by ramil on 11.01.2022.
//

import SwiftUI

struct PictureOfTheDayView: View {
    
    @ObservedObject var manager = NetworkManager()
    
    var body: some View {
        VStack {
            Text(manager.photoInfo.title)
            Text(manager.photoInfo.date)
            Text(manager.photoInfo.description)
        }
    }
}

struct PictureOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        PictureOfTheDayView()
    }
}
