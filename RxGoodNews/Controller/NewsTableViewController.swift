//
//  NewsTableViewController.swift
//  RxGoodNews
//
//  Created by Amsaraj M on 21/6/2565 BE.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    private let disposeBag = DisposeBag()
    private var articles = [Articles]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        getTopNews()
    }
    
    private func getTopNews() {
        let resource = ArticleList.all
        URLRequest.load(resource: resource)
            .subscribe(onNext: { result in
                if let articles = result?.articles {
                    self.articles = articles
                    DispatchQueue.main.async { [weak self] in
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }
}

extension NewsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else { return UITableViewCell() }
        let article = self.articles[indexPath.row]
        cell.bindCell(article: article)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}



