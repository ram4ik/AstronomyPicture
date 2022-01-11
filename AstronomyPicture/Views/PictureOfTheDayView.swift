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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PictureOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        PictureOfTheDayView()
    }
}
