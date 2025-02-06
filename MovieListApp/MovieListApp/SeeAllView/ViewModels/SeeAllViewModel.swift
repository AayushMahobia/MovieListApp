//
//  SeeAllViewModel.swift
//  MovieListApp
//
//  Created by Admin on 06/02/25.
//

import Foundation

class SeeAllViewModel: ObservableObject {
    func getNavBarModel (category: String ,leftAction: (() -> Void)?) -> NavBarModel {
        let model = NavBarModel(navBarTitle: category, leftIcon: "chevron.left", rightIcon: "ellipsis", leftIconAction:  {
            leftAction?()
        })
        return model
    }
}
