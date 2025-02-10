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
    @EnvironmentObject var pathManager: NavigationPathManager
    
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
                        ForEach(0..<(category.categoryData.results.count), id: \.self){ i in
                            MovieCardView(movieData: category.categoryData.results[i])
                                .onTapGesture {
                                    let id: String = category.categoryData.results[i].id ?? ""
                                    pathManager.path.append(id)
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
