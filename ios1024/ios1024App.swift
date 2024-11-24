//
//  ios1024App.swift
//  ios1024
//
//  Created by Hans Dulimarta for CIS357
//

import SwiftUI
import FirebaseCore

/// Hanldes application level config
class AppDelegate: NSObject, UIApplicationDelegate {
  // Runs when the application launches
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure() // Firebase configures upon app launch
    return true
  }
}

@main
struct ios1024App: App {
    // Attach the AppDelegate to main app
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            // Entry point call
            AppView()
        }
    }
}
