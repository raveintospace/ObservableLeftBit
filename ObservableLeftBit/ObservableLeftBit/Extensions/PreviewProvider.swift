//
//  PreviewProvider.swift
//  ObservableLeftBit
//
//  Created by Uri on 29/7/24.
//

import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

@MainActor
final class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }  // instance can only be initialized from class DeveloperPreview
    
    let homeVM = HomeViewModel()
}
