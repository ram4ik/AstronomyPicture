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
        VStack(alignment: .leading, spacing: 20) {
            
            if manager.image != nil {
                Image(uiImage: self.manager.image!)
                    .resizable()
                    .scaledToFit()
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text(manager.photoInfo.title)
                        .font(.title)
                    Text(manager.photoInfo.date)
                        .font(.headline)
                    Text(manager.photoInfo.description)
                }
            }.padding()
        }
    }
}

struct PictureOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        
        let view = PictureOfTheDayView()
        view.manager.photoInfo = PhotoInfo.createDefault()
        view.manager.image = UIImage(named: "preview_image")
        
        return view
    }
}
