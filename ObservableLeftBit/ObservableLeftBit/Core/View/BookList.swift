//
//  ContentView.swift
//  ObservableLeftBit
//  https://github.com/theleftbit/NSBarcelona-Feb24 - repo
//  Created by Uri on 29/7/24.
//

import SwiftUI

struct BookList: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else if let _ = viewModel.error {
                ErrorView()
            } else {
                List(viewModel.books, id: \.index) { book in
                    VStack(alignment: .leading) {
                        Text(book.title)
                            .foregroundStyle(.primary)
                        Text(book.releaseDate)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
        .task {
            await viewModel.getBooks()
        }
    }
}

#Preview {
    BookList(viewModel: HomeViewModel())
}




