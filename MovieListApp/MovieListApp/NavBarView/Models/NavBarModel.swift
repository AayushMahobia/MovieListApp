//
//  NavBarModel.swift
//  MovieListApp
//
//  Created by Admin on 06/02/25.
//

import Foundation

struct NavBarModel {
    let navBarTitle: String?
    let leftIcon: String?
    let rightIcon: String?
    let leftIconAction: (() -> Void)?
    let rightIconAction: (() -> Void)?
    
    init(navBarTitle: String? = nil, leftIcon: String? = nil, rightIcon: String? = nil, leftIconAction: (() -> Void)? = nil, rightIconAction: (() -> Void)? = nil) {
        self.navBarTitle = navBarTitle
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.leftIconAction = leftIconAction
        self.rightIconAction = rightIconAction
    }
}
