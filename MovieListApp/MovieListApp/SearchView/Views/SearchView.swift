//
//  SearchView.swift
//  MovieListApp
//
//  Created by Admin on 10/02/25.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var searchViewModel: SearchViewModel = SearchViewModel()
    @EnvironmentObject var pathManager: NavigationPathManager
    
    var body: some View {
        ZStack{
            // background
            Color.black.ignoresSafeArea(edges: .all)
            
            // foreground
            VStack(spacing: 18){
                SearchBarView(searchViewModel: searchViewModel)
                ScrollView{
                    if searchViewModel.isLoading {
                        ProgressView()
                    } else{
                        if let searchData = searchViewModel.searchData, searchData.count>0 {
                            VStack{
                                ForEach(0..<searchData.count, id: \.self) { i in
                                    MovieCardView(movieData: searchData[i])
                                        .onTapGesture {
                                            let id: String = searchData[i].id ?? ""
                                            pathManager.path.append(id)
                                        }
                                }
                            }
                        }
                    }
                }
            }
        }
        .toolbarVisibility(.hidden, for: .tabBar)
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
}

#Preview {
    SearchView()
}
