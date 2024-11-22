//
//  AppView.swift
//  ios1024
//
//  Created by Clay Beal on 11/12/24.
//

import SwiftUI

struct AppView: View {
    @ObservedObject private var navCtrl: MyNavigator = MyNavigator()
    @StateObject var vm: GameViewModel = GameViewModel()
    var body: some View {
        NavigationStack(path: $navCtrl.navPath) {
            LoginView()
                .environmentObject(vm)
                .environmentObject(navCtrl)
                .navigationDestination(for: Destination.self) { dest in
                    switch(dest) {
                    case .GameDestination: GameView().navigationBarBackButtonHidden(true).environmentObject(vm)
                    case .NewAccountDestination: NewAccountView().environmentObject(vm)
                    case .SettingsDestination: SettingsView().environmentObject(vm)
                    case .StatisticDestination: StatsView().environmentObject(vm)
                    case .LoginDestination: SignInView().environmentObject(vm)
                    }
                }
        }
        .environmentObject(navCtrl) // Makes all views able to use the navCtrl
    }
}
