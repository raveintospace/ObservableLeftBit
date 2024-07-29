//
//  HomeViewModel.swift
//  ObservableLeftBit
//
//  Created by Uri on 29/7/24.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var isLoading: Bool
    @Published var error: Swift.Error?
    @Published var books: [Book]
    
    let manager = DataService()
    
    init(isLoading: Bool = false, error: Error? = nil, books: [Book] = []) {
        self.isLoading = isLoading
        self.error = error
        self.books = books
    }
}

extension HomeViewModel {
    
    func populateData() async {
        self.isLoading = true
        
        guard let url = URL(string: "https://potterapi-fedeperin.vercel.app/en/books") else { return }
        
        let request: URLRequest = URLRequest(url: url)
        
        do {
            let response = try await URLSession.shared.data(for: request).0
            let books = try JSONDecoder().decode([Book].self, from: response)
            self.books = books
        } catch {
            self.error = error
        }
        self.isLoading = false
    }
    
    
    
    func getBooks() async {
        guard let url = URL(string: "https://potterapi-fedeperin.vercel.app/en/books") else { return }
        
        do {
            let data = try await manager.getData(url: url)
            let books = try JSONDecoder().decode([Book].self, from: data)
            self.books = books
        } catch {
            self.error = error
        }
    }
}
