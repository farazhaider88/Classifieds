//
//  Classified.swift
//  Classifieds
//
//  Created by Faraz Haider on 07/02/2021.
//

import Foundation

struct ClassifiedResponseModel: Codable {
    let results: [Classified]
}


struct Classified: Codable{
    let created_at, price, name, uid: String?
    let image_ids: [String]?
    let image_urls, image_urls_thumbnails: [String]?
}


extension Classified{
    
    static var classifiedList: Resource<ClassifiedResponseModel> = {
        guard let url = URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer") else{
            fatalError("URL is incorrect")
        }
        return Resource<ClassifiedResponseModel>(url: url)
    }()
    
}

