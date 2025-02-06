//
//  NavBarView.swift
//  MovieListApp
//
//  Created by Admin on 05/02/25.
//

import SwiftUI

struct NavBarView: View {
    
    private let model: NavBarModel
    
    init(model: NavBarModel) {
        self.model = model
    }
    
    var body: some View {
        HStack{
            HStack(spacing: 16){
                if let leftIcon = model.leftIcon, !leftIcon.isEmpty {
                    Image(systemName: leftIcon)
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(width: 44, height: 44)
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                        .onTapGesture {
                            model.leftIconAction?()
                        }
                        .padding(.leading)
                }
                if let title = model.navBarTitle, !title.isEmpty {
                    Text(title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                }
            }
            
            Spacer()
            
            if let rightIcon = model.rightIcon, !rightIcon.isEmpty {
                Image(systemName: rightIcon)
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(width: 44, height: 44)
                    .background(.ultraThinMaterial)
                    .clipShape(Circle())
                    .onTapGesture {
                        model.rightIconAction?()
                    }
                    .padding(.trailing)
            }
        }
        .padding(.vertical, 12)
    }
}

#Preview {
    let model: NavBarModel = NavBarModel(leftIcon: "person.fill", rightIcon: "magnifyingglass") {
        print("Left icon clicked")
    } rightIconAction: {
        print("right icon clicked")
    }

    NavBarView(model: model)
}
