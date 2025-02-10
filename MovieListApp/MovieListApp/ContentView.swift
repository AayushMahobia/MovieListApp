//
//  ContentView.swift
//  MovieListApp
//
//  Created by Admin on 04/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var pathManager: NavigationPathManager = NavigationPathManager()

    var body: some View {
        TabView{
            Tab {
                HomeView()
            } label: {
                Image(systemName: "house.fill")
            }
            
            Tab {
                Text("Tab 2")
            } label: {
                Image(systemName: "hand.thumbsup.circle.fill")
            }
            
            Tab {
                Text("Tab 3")
            } label: {
                Image(systemName: "icloud.and.arrow.down.fill")
            }
            
            Tab {
                Text("Tab 4")
            } label: {
                Image(systemName: "movieclapper.fill")
            }
        }
        .environmentObject(pathManager)
        .preferredColorScheme(.dark)
        .tint(.white)
    }
}

#Preview {
    ContentView()
        .environmentObject(NavigationPathManager())
}
