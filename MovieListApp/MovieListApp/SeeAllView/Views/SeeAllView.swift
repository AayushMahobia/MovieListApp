//
//  SeeAllView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI

struct SeeAllView: View {
    
    let category: CategoryModel
    @StateObject var seeAllViewModel: SeeAllViewModel = SeeAllViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            // background
            Color.black
                .ignoresSafeArea(edges: .all)
            
            // foreground
            VStack(alignment: .leading, spacing: 20) {
                NavBarView(model: seeAllViewModel.getNavBarModel(category: category.categoryName ,leftAction: {
                    dismiss()
                }))
                ScrollView{
                    VStack{
                        ForEach(0..<category.categoryData.rows, id: \.self){ i in
                            NavigationLink(value: category.categoryData.results[i].id) {
                                MovieCardView(movieData: category.categoryData.results[i])
                            }
                        }
                    }
                }
            }
            .toolbarVisibility(.hidden, for: .navigationBar)
            .toolbarVisibility(.hidden, for: .tabBar)
        }
    }
}

//#Preview {
//    SeeAllView(category: "Action")
//}
