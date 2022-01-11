//
//  PictureOfTheDayView.swift
//  AstronomyPicture
//
//  Created by ramil on 11.01.2022.
//

import SwiftUI

struct PictureOfTheDayView: View {
    
    @ObservedObject var manager = NetworkManager()
    
    @State private var showSwitchDate: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            
            Button {
                showSwitchDate.toggle()
            } label: {
                Image(systemName: "calendar")
                Text("Switch day")
            }
            .padding(.trailing)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .popover(isPresented: $showSwitchDate) {
                SelectDateView(manager: self.manager)
            }

            
            if manager.image != nil {
                Image(uiImage: self.manager.image!)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
                    .padding(100)
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
