//
//  ImageLoader.swift
//  MyairopsChallenge
//
//  Created by Stebin Alex on 13/03/23.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    private static let cache = NSCache<NSURL, UIImage>()
    
    @Published var image: UIImage?
    
    private let url: NSURL
    
    private var cancellable: AnyCancellable?
    
    private var cacheSubscriber: AnyCancellable?
    
    init(url: NSURL) {
        self.url = url
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        if let image = ImageLoader.cache.object(forKey: url) {
            self.image = image
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url as URL)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveOutput: { image in
                if let image = image {
                    ImageLoader.cache.setObject(image, forKey: self.url)
                }
            })
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
}




