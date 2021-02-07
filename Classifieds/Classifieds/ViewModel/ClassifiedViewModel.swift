//
//  ClassifiedViewModel.swift
//  Classifieds
//
//  Created by Faraz Haider on 08/02/2021.
//

import Foundation

class ClassifiedListViewModel {
    var classifiedViewModel:[ClassifiedViewModel]
    init(){
        self.classifiedViewModel = [ClassifiedViewModel]()
    }
}

extension ClassifiedListViewModel{
    
    func classifiedViewModel(at index:Int)->ClassifiedViewModel{
        return self.classifiedViewModel[index]
    }
}


struct ClassifiedViewModel {
    let classified:Classified
}

extension ClassifiedViewModel {
    var name:String{
        return classified.name ?? ""
    }
    
    var price:String{
        return classified.price ?? ""
    }
    
    var imageUrlThumbnail: String{
        return classified.image_urls_thumbnails?[0] ?? ""
    }
    
    var imageUrl: String{
        return classified.image_urls?[0] ?? ""
    }
}
