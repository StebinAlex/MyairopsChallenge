//
//  ImageView.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import SwiftUI

struct ImageView: View {
    @StateObject private var imageLoader: ImageLoader
    
    init(url: NSURL) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill) 
        } else {
            ProgressView()
                .onAppear(perform: imageLoader.load)
        }
    }
}

