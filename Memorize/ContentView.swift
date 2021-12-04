//
//  ContentView.swift
//  Memorize
//
//  Created by Pamela Vermeer on 11/28/21.
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

struct ContentView: View {
    @State var emojis = vehicleEmojis
    
    var body: some View {
        VStack {
            ScrollView {
                Text("Memorize!")
                    .font(.title)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis, id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                theme1
                Spacer()
                theme2
                Spacer()
                theme3
            }
            .padding(.horizontal)
            .font(.largeTitle)
            Spacer()
        }
        .padding(.horizontal)
        
    }
    
    var theme1: some View {
        Button{
            emojis = weatherEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "tornado")
                Text("Weather").font(.footnote)
            }
        }
    }
    
    var theme2: some View {
        Button {
            emojis = vehicleEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "ferry")
                Text("Vehicles").font(.footnote)
            }
        }
    }
    
    var theme3: some View {
        Button {
            emojis = sportsEmojis.shuffled()
        } label: {
            VStack {
                Image(systemName: "stopwatch")
                Text("Sports").font(.footnote)
            }
        }
    }
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 25)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
.previewInterfaceOrientation(.landscapeRight)
        ContentView()
            .preferredColorScheme(.light)
    }
}

