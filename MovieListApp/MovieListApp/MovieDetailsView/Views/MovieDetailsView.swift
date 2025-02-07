//
//  MovieDetailsView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let movieId: String
    @StateObject var movieDetailsViewModel: MovieDetailsViewModel = MovieDetailsViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            // background
            Color.black
                .ignoresSafeArea(.all)
            
            // foreground
            ZStack(alignment: .top){
                ScrollView{
                    VStack(alignment: .leading, spacing: 22){
                        TrailerView(movieDetails: movieDetailsViewModel.movieDetails)
                        
                        // Prolog
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Prolog")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text(movieDetailsViewModel.movieDetails?.description ?? "Some Description")
                                .font(.system(size: 14))
                                .lineSpacing(7)
                                .foregroundStyle(.gray)
                        }
                        .padding(.horizontal)
                        
                        CastView(movieDetails: movieDetailsViewModel.movieDetails)
                    }
                }
                NavBarView(model: movieDetailsViewModel.getNavBarModel(leftAction: {
                    dismiss()
                }))
            }
            .redactionShimmerViewModifier(isLoading: $movieDetailsViewModel.isLoading)
        }
        .onAppear(){
            Task {
                await movieDetailsViewModel.fetchMovieData(movieId: movieId)
            }
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .toolbarVisibility(.hidden, for: .tabBar)
    }
}

#Preview {
    MovieDetailsView(movieId: "tt1375666")
}
