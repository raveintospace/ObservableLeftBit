//
//  DataService.swift
//  ObservableLeftBit
//
//  Created by Uri on 29/7/24.
//

import Foundation

final class DataService {
    
    func getData(url: URL) async throws -> Data {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return data
        } catch {
            throw error
        }
    }
}
