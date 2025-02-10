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
    @EnvironmentObject var pathManager: NavigationPathManager
    
    var body: some View {
        NavigationStack(path: $pathManager.path) {
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
                                    if let categoryData = homeViewModel.categoryDict[category] {
                                        CategoryView(categoryData: categoryData, categoryName: category)
                                    }
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
                        pathManager.path.append("SearchView")
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
                .redactionShimmerViewModifier(isLoading: $homeViewModel.isLoading)
            }
            .navigationDestination(for: CategoryModel.self, destination: { category in
                SeeAllView(category: category)
            })
            .navigationDestination(for: String.self) { destination in
                if destination == "SearchView" {
                    SearchView()
                } else {
                    MovieDetailsView(movieId: destination)
                }
            }
        }
        .onAppear(){
            Task{
                homeViewModel.apiCount = 0
                for category in homeViewModel.categoryList {
                    await homeViewModel.fetchData(category: category)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
