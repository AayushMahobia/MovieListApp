//
//  MovieDetailsView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI

struct MovieDetailsView: View {
    
    let id: String
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
                        TrailerView()
                        
                        // Prolog
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Prolog")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O., but his tragic past may doom the project and his team to disaster.")
                                .font(.system(size: 14))
                                .lineSpacing(7)
                                .foregroundStyle(.gray)
                        }
                        .padding(.horizontal)
                        
                        CastView()
                    }
                }
                NavBarView(model: movieDetailsViewModel.getNavBarModel(leftAction: {
                    dismiss()
                }))
            }
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
        .toolbarVisibility(.hidden, for: .tabBar)
    }
}

#Preview {
    MovieDetailsView(id: "123")
}
