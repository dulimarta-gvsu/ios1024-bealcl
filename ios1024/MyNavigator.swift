//
//  MyNavigator.swift
//  ios1024
//
//  Created by Clay Beal on 11/12/24.
//

import SwiftUI

enum Destination {
    case LoginDestination
    case NewAccountDestination
    case GameDestination
    case SettingsDestination
    case StatisticDestination
}

class MyNavigator: ObservableObject {
    // If you want more control on navigating the stack
    // @Published var myNavStack: Array<Destination> = []
    @Published var navPath: NavigationPath = NavigationPath()
    
    func navigate(to d: Destination) {
        navPath.append(d)
    }
    
    func navBack() {
        navPath.removeLast()
    }
    
    func backHome() {
        while navPath.count > 0 {
            navPath.removeLast()
        }
    }
    
    
}
