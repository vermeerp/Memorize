//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Pamela Vermeer on 11/28/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
