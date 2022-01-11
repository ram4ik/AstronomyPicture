//
//  SelectDateView.swift
//  AstronomyPicture
//
//  Created by ramil on 11.01.2022.
//

import SwiftUI

struct SelectDateView: View {
    
    @State private var date = Date()
    @ObservedObject var manager: NetworkManager
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            Text("Select a day")
                .font(.headline)
            DatePicker(selection: $date, in: ...Date(), displayedComponents: .date) {
                Text("select")
            }
            .labelsHidden()
            
            Button {
                self.manager.date = self.date
                self.presentation.wrappedValue.dismiss()
            } label: {
                Text("Done")
            }

        }
    }
}

struct SelectDateView_Previews: PreviewProvider {
    static var previews: some View {
        SelectDateView(manager: NetworkManager())
    }
}
