//
//  NewsData.swift
//  Mesa News
//
//  Created by Felipe Figueirôa on 10/11/20.
//

import Foundation

struct NewsData: Codable {
    let pagination: Pagination
    let data: [NewsModel]
}

struct NewsModel: Codable {
    let title, datumDescription, content, author: String
    let publishedAt: String
    let highlight: Bool
    let url, imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case datumDescription = "description"
        case content, author
        case publishedAt = "published_at"
        case highlight, url
        case imageURL = "image_url"
    }
}

struct Pagination: Codable {
    let currentPage, perPage, totalPages, totalItems: Int
    
    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case perPage = "per_page"
        case totalPages = "total_pages"
        case totalItems = "total_items"
    }
}


