//
//  Article.swift
//  FreshNews
//
//  Created by Baris Ciftci on 10/01/2023.
//

import Foundation

struct Article {
    let source: Source
    
    
    let title: String
    let url: String
    let publishedAt: String
    
    let description: String?
    let author: String?
    let urlToImage: String?
    
    var authorText: String {
        author ?? ""
    }
    
    var descriptionText: String {
        description ?? ""
    }
    
    var articleURL: URL {
        URL(string: url)!
    }
    
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
}

extension Article: Codable {}
extension Article: Equatable {}
extension Article: Identifiable {
    var id: String {url}
}

struct Source {
    let name: String
}
extension Source: Codable {}
extension Source: Equatable {}

extension Article {
    static var previewData: [Article] {
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!
        let data = try! Data(contentsOf: previewDataURL)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dataDecodingStrategy = .base64
        
        let apiresponse = try!
        jsonDecoder.decode(NewsAPIResponse.self, from: data)
        return apiresponse.articles ?? []
    }
}
