//
//  CustomImageView.swift
//  Classifieds
//
//  Created by Faraz Haider on 08/02/2021.
//


import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    
  func cacheImage(urlString: String){
    let url = URL(string: urlString)
    
    image = nil
    
    if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
        self.image = imageFromCache
        return
    }
        
    URLSession.shared.dataTask(with: url!) {
        data, response, error in
        if data != nil {
              DispatchQueue.main.async {
                  let imageToCache = UIImage(data: data!)
                  imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                  self.image = imageToCache
              }
          }
     }.resume()
  }
}
