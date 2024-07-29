//
//  ContentView.swift
//  ObservableLeftBit
//
//  Created by Uri on 29/7/24.
//

import SwiftUI

struct BookList: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        if viewModel.isLoading {
            ProgressView()
        } else if let _ = viewModel.error {
            ErrorView()
        } else {
            List(viewModel.books, id: \.id) { book in
                VStack {
                    Text(book.title)
                        .foregroundStyle(.primary)
                    Text(book.author)
                        .foregroundStyle(.secondary)
                    Text("Test")
                }
            }
        }
    }
}

#Preview {
    BookList(viewModel: HomeViewModel())
}




