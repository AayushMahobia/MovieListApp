//
//  HomeView.swift
//  MovieListApp
//
//  Created by Admin on 04/02/25.
//

import SwiftUI

struct HomeView: View {
    
    @State var tabMinYOffset: CGFloat = 0.0
    @State var navBarMaxYOffset: CGFloat = 0.0
    
    @StateObject var homeViewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack{
                // background
                Color.black
                    .ignoresSafeArea(edges: .all)
                
                // foreground
                ZStack(alignment: .top) {
                    ScrollView {
                        VStack(spacing: 18) {
                            BannerView()
                            VStack(spacing: 18) {
                                ForEach(homeViewModel.categoryList, id: \.self) { category in
                                    CategoryView(category: category)
                                }
                            }
                            .background(GeometryReader { geometry -> SwiftUI.Color in
                                DispatchQueue.main.async {
                                    tabMinYOffset = geometry.frame(in: .global).minY
                                    //print(tabMinYOffset)
                                }
                                return Color.clear
                            })
                        }
                    }
                    .scrollIndicators(.hidden)
                    .ignoresSafeArea(edges: .top)
                    
                    NavBarView(model: homeViewModel.getNavBarModel(rightAction: {
                        
                    }))
                    .background(GeometryReader { geometry -> SwiftUI.Color in
                        DispatchQueue.main.async {
                            navBarMaxYOffset = geometry.frame(in: .global).maxY
                            //print(navBarMaxYOffset)
                        }
                        return Color.clear
                    })
                    .background(navBarMaxYOffset <= tabMinYOffset ? Color.clear : Color.black)
                }
            }
//            .navigationDestination(for: String.self) { str in
//                if homeViewModel.categoryList.contains(str) {
//                    SeeAllView(category: str)
//                } else {
//                    MovieDetailsView(id: str)
//                }
//            }
        }
//        .onAppear(){
//            Task{
//                await
//            }
//        }
    }
}

#Preview {
    HomeView()
}
