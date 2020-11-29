//
//  Book.swift
//  ReadMe
//
//  Created by daria on 25/11/2020.
//

struct Book: Hashable {
    let title: String;
    let author: String;
    
    init(title: String = "Title", author: String = "Author") {
        self.title = title
        self.author = author
    }
}
