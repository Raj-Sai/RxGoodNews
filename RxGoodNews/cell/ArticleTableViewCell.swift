//
//  ArticleTableViewCell.swift
//  RxGoodNews
//
//  Created by Amsaraj M on 21/6/2565 BE.
//

import Foundation
import UIKit


class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func bindCell(article: Articles) {
        title.text = article.title
        descriptionLabel.text = article.description
    }
}
