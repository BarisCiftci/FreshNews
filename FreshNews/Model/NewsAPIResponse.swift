//
//  NewsAPIResponse.swift
//  FreshNews
//
//  Created by Baris Ciftci on 10/01/2023.
//

import Foundation

struct NewsAPIResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
}
