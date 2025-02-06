//
//  MovieDetailsViewModel.swift
//  MovieListApp
//
//  Created by Admin on 06/02/25.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    func getNavBarModel (leftAction: (() -> Void)?) -> NavBarModel {
        let model = NavBarModel(leftIcon: "chevron.left", rightIcon: "ellipsis", leftIconAction:  {
            leftAction?()
        })
        return model
    }
}
