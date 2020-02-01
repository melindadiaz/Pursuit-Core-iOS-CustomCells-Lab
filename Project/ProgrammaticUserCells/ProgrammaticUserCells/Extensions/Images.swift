//
//  Images.swift
//  ProgrammaticUserCells
//
//  Created by Melinda Diaz on 1/31/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

extension UIImageView {
    
    
    func getImages(imageUrl:String, completion: @escaping (Result<UIImage,AppError>) ->())  {
        guard let url = URL(string: imageUrl) else {
            completion(.failure(.badURL))
            return
        }
        NetworkHelper.manager.performDataTask(withUrl: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.other(rawError: appError)))
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(.success(image))
                }
                
            }
        }
    }
    
    
}
