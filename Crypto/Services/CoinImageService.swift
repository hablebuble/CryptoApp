//
//  CoinImageService.swift
//  Crypto
//
//  Created by Alexey Strelnikov on 16.11.2022.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    private let coin: CoinModel
    private let fileManager = LocalFileManager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    
    
    init(coin: CoinModel) {
        self.coin = coin
        self.imageName = coin.id
        getCoinImage()
        
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: coin.id, folderName: folderName) {
            image = savedImage
//            print("Retrive Image from Local File Storage")
        }
        else {
            downloadCoinImage()
//            print("Downloading image now...")
        }
        
    }
    
    private func downloadCoinImage() {
        guard let url = URL(string: coin.image)
        else {
            return
        }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                
                self.image = returnedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
}
