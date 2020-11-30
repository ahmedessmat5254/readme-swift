//
//  DetailView.swift
//  ReadMe
//
//  Created by daria on 29/11/2020.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct DetailView: View {
    @ObservedObject var book: Book
    @Binding var image: UIImage?
    @State var showingImagePicker = false
    @State var showingDeleteAlert = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                BookmarkButton(book: book)
                
                TitleAndAuthorStack(
                    book: book,
                    titleFont: .title,
                    authorFont: .title2
                )
            }
            VStack {
                Divider()
                    .padding(.vertical)
                TextField("Review...", text: $book.microReview)
                Book.Image(
                    uiImage: image,
                    title: book.title,
                    cornerRadius: 16
                )
                .scaledToFit()
                
                let updateButton =
                    Button("Update Image") {
                        showingImagePicker = true
                    }
                    .padding()
                
                if image != nil {
                    HStack {
                        Spacer()
                        Button("Delete Image") {
                            showingDeleteAlert = true
                        }
                        Spacer()
                        updateButton
                        Spacer()
                    }
                } else {
                    updateButton
                }
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showingImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .alert(isPresented: $showingDeleteAlert) {
            .init(
                title: .init("Delete imige from \(book.title)?"),
                primaryButton: Alert.Button.destructive(.init("Delete")) {
                    image = nil
                },
                secondaryButton: Alert.Button.cancel()
            )
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(),
                   image: .constant(nil))
            .previewdInAllColorSchemes
    }
}
