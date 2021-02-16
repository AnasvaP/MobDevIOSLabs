//
//  model.swift
//  mobileDevelopmentLab1.1
//
//  Created by Anastasiia Poliukovych on 15.02.2021.
//

import Foundation

// MARK: - Github
struct Github: Codable {
    let books: [Book]
}

// MARK: - Book
struct Book: Codable {
    let title, subtitle, isbn13, price: String
    let image: String
}
