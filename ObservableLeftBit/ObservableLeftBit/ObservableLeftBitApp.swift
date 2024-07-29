//
//  ObservableLeftBitApp.swift
//  ObservableLeftBit
//
//  Created by Uri on 29/7/24.
//

import SwiftUI

@main
struct ObservableLeftBitApp: App {
    var body: some Scene {
        WindowGroup {
            BookList(viewModel: HomeViewModel())
        }
    }
}
