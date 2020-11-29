//
//  BookViews.swift
//  ReadMe
//
//  Created by daria on 25/11/2020.
//

import SwiftUI

struct TitleAndAuthorStack: View {
    let book: Book
    let titleFont: Font
    let authorFont: Font
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(book.title)
                .font(.title2)
            Text(book.author)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
}

extension Book {
    struct Image: View {
        let uiImage: UIImage?
        let title: String
        var size: CGFloat?
        let cornerRadius: CGFloat
        
        var body: some View {
            if let image = uiImage.map(SwiftUI.Image.init) {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: size, height: size)
                    .cornerRadius(cornerRadius)
            } else {
                let symbol = SwiftUI.Image(title: title)
                    ?? .init(systemName: "book")
                    
                symbol
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .font(Font.title.weight(.light))
                    .foregroundColor(.secondary)
            }
        }
    }
}

struct Book_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TitleAndAuthorStack(
                book: .init(),
                titleFont: .title,
                authorFont: .title2
            )
            Book.Image(title: Book().title)
            Book.Image(title: "")
            Book.Image(title: "🐱")
        }
        .previewdInAllColorSchemes
    }
}

extension Image {
    init?(title: String) {
        guard
            let character = title.first,
            case let symbolName = "\(character.lowercased()).square",
            UIImage(systemName: symbolName) != nil
        else {
            return nil
        }
        
        self.init(systemName: symbolName)
    }
}

extension Book.Image {
    /// A preview Image.
    init(title: String) {
        self.init(
            uiImage: nil,
            title: title,
            cornerRadius: .init()
        )
    }
}

extension View {
    var previewdInAllColorSchemes: some View {
        ForEach(ColorScheme.allCases, id: \.self, content: preferredColorScheme)
    }
}
