//
//  ContentView.swift
//  MovieListApp
//
//  Created by Admin on 04/02/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView{
            Tab {
                HomeView()
            } label: {
                Image(systemName: "house.fill")
            }
            
            Tab {
                Color.black.ignoresSafeArea(edges: .all)
            } label: {
                Image(systemName: "hand.thumbsup.circle.fill")
            }
            
            Tab {
                Color.black.ignoresSafeArea(edges: .all)
            } label: {
                Image(systemName: "icloud.and.arrow.down.fill")
            }
            
            Tab {
                Color.black.ignoresSafeArea(edges: .all)
            } label: {
                Image(systemName: "movieclapper.fill")
            }
        }
        .preferredColorScheme(.dark)
        .tint(.white)
    }
}

#Preview {
    ContentView()
}
