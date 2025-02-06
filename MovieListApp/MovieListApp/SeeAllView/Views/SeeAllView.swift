//
//  SeeAllView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI

struct SeeAllView: View {
    
    let category: String
    @StateObject var seeAllViewModel: SeeAllViewModel = SeeAllViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // background
            Color.black
                .ignoresSafeArea(edges: .all)
            
            // foreground
            VStack(alignment: .leading, spacing: 18) {
                NavBarView(model: seeAllViewModel.getNavBarModel(category: category ,leftAction: {
                    dismiss()
                }))
                ScrollView{
                    VStack{
                        NavigationLink(value: "id") {
                            MovieCardView()
                        }
                    }
                }
            }
            .toolbarVisibility(.hidden, for: .navigationBar)
            .toolbarVisibility(.hidden, for: .tabBar)
        }
    }
}

#Preview {
    SeeAllView(category: "Action")
}
