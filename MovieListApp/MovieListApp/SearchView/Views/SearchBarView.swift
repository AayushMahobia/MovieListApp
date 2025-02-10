//
//  SearchBarView.swift
//  MovieListApp
//
//  Created by Admin on 10/02/25.
//

import SwiftUI

struct SearchBarView: View {
    
    @ObservedObject var searchViewModel: SearchViewModel
    @FocusState var isFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack{
            Image(systemName: "chevron.left")
                .frame(width: 44, height: 44)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .padding(.leading)
                .onTapGesture {
                    dismiss()
                }
            HStack {
                TextField("Search", text: $searchViewModel.searchText)
                    .padding(.leading)
                    .focused($isFocused)
                Image(systemName: searchViewModel.searchText == "" ? "" : "xmark")
                    .padding(.trailing)
                    .onTapGesture {
                        searchViewModel.searchText = ""
                    }
            }
            .frame(height: 44)
            .background(.ultraThinMaterial)
            .clipShape(.capsule)
            
            Image(systemName: "magnifyingglass")
                .frame(width: 44, height: 44)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
                .padding(.trailing)
                .onTapGesture {
                    Task{
                        await searchViewModel.fetchData(searchText: searchViewModel.searchText)
                    }
                }
        }
        .font(.headline)
        .foregroundStyle(.white)
        .onAppear(){
            isFocused = true
        }
    }
}

//#Preview {
//    SearchBarView()
//}
