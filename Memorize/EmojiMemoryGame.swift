//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Pamela Vermeer on 12/24/21.
//

import SwiftUI

let vehicleEmojis = ["🚍", "🚜", "🚝", "⛵️","🏍","🚡",
                     "🛴","🚃", "🚒","🛻","✈️","🛶",
                     "🚁","🚀","🚂","🛳"]
let weatherEmojis = ["🌪", "🌈", "☀️", "🌤", "⛅️", "🌦",
                     "🌨", "❄️", "☁️", "🌊", "💨", "☔️"]
let sportsEmojis = ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐",
                    "🥏", "🏸", "🏒", "🏑", "🥍", "🏏",
                    "🪃", "⛳️", "🥊", "🥌", "🛼", "⛸"]

let themes = [
    Theme(name: "Vehicles", symbol: "ferry", emojis: vehicleEmojis.shuffled(), pairsOfCards: 12, color: "blue"),
    Theme(name: "Weather", symbol: "tornado", emojis: weatherEmojis.shuffled(), pairsOfCards: 12, color: "purple"),
    Theme(name: "Sports", symbol: "ferry", emojis: sportsEmojis.shuffled(), pairsOfCards: 18, color: "teal"),
]

class EmojiMemoryGame: ObservableObject {
    private var theme = themes.randomElement()!
    @Published private var model: MemoryGame<String>

    static func createMemoryGame(gameTheme: Theme) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: gameTheme.pairsOfCards) {
            pairIndex in gameTheme.emojis[pairIndex]}
    }
    
    init() {
        theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(gameTheme: theme)
    }
     
    func resetGame() {
        theme = themes.randomElement()!
        model = EmojiMemoryGame.createMemoryGame(gameTheme: theme)
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var title: String {
        theme.name
    }
    
    var symbol: String {
        theme.symbol
    }
    
    var themeColor: Color {
        switch theme.color {
        case "red":
            return .red
        case "green":
            return .green
        case "blue":
            return .blue
        case "yellow":
            return .yellow
        case "orange":
            return .orange
        case "purple":
            return .purple
        case "pink":
            return .pink
        case "cyan":
            return .cyan
        case "teal":
            return .teal
        default:
            return .mint
        }
    }
    
    // MARK: Intents
    func choose(_ card: MemoryGame<String>.Card ) {
        model.choose(card)
    }
}
