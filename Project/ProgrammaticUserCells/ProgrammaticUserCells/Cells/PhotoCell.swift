//
//  collectionCell.swift
//  ProgrammaticUserCells
//
//  Created by Melinda Diaz on 1/31/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    
    func configureCell(instance: User) {
        imageViewCell.getImages(imageUrl: instance.picture.large) { [weak self] (result) in
            switch result {
            case .failure:
                DispatchQueue.main.async {
                    self?.imageViewCell.image = UIImage(named: "starTrek")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.imageViewCell.image = image
                }
            }
        }
    }
    
    
    
    
}
