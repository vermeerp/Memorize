//
//  ContentView.swift
//  Memorize
//
//  Created by Pamela Vermeer on 11/28/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    Image(systemName: viewModel.symbol)
                    Text(viewModel.title)
                        .font(.title)
                    Image(systemName: viewModel.symbol)
                    
                }
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            Spacer()
            HStack {
                newGame
                Spacer()
                Text("Score: ")
            }
            .padding(.horizontal)
            .font(.largeTitle)
            Spacer()
        }
        .foregroundColor(viewModel.themeColor)
        .padding(.horizontal)
        
    }
    
    struct CardView: View {
        
        let card: MemoryGame<String>.Card
        var body: some View {
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 25)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(.largeTitle)
                } else if card.isMatched {
                    shape.opacity(0.0)
                } else {
                    shape.fill()
                }
            }
        
        }
    }

    var newGame: some View {
        Button{
            viewModel.resetGame()
        } label: {
            VStack {
                Image(systemName: "plus.circle")
                Text("New Game").font(.footnote)
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}

