//
//  Articles.swift
//  RxGoodNews
//
//  Created by Amsaraj M on 21/6/2565 BE.
//

import Foundation

struct ArticleList: Decodable {
    var articles: [Articles]?
}

struct Articles: Decodable {
    var title: String?
    var description: String?
}

extension ArticleList {
    static var all: Resource<ArticleList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=64b1ae9782164fa1a683eececf3fff81")!
        return Resource(url: url)
    }()
}
