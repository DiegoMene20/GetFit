//
//  ViewRouter.swift
//  GetFit
//
//  Created by Diego Menegatti on 3/29/23.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .MainPage
    
    enum Page {
        case MainPage
        case SignInPage
        case SignUpPage
    }
    
}
