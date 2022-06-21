//
//  URLRequest+Extension.swift
//  RxGoodNews
//
//  Created by Amsaraj M on 21/6/2565 BE.
//

import Foundation
import RxSwift
import RxCocoa

struct Resource<T: Decodable> {
    let url: URL
}

extension URLRequest {
    
    static func load<T>(resource: Resource<T>) -> Observable<T?> {
        return Observable.from([resource.url])
            .flatMap { url -> Observable<Data> in
                let url = URLRequest(url: url)
                return URLSession.shared.rx.data(request: url)
            }.map { data -> T? in
                return try? JSONDecoder().decode(T.self, from: data)
            }.asObservable()
    }
}
