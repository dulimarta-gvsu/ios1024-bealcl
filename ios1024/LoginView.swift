//
//  LoginView.swift
//  ios1024
//
//  Created by Clay Beal on 11/12/24.
//

import SwiftUI

struct LoginView: View {
    // Navigation controls
    @EnvironmentObject var navi: MyNavigator
    // Accessing shared GameViewModel
    @EnvironmentObject var vm: GameViewModel
    @State var loginError: String = ""
    
    var body: some View {
        VStack {
            // Text on the login screen
            Text("Login Here")
            if loginError.count > 0 {
                Text("Login feedback \(loginError)")
            }
            HStack {
                Button("Sign In") {
                    navi.navigate(to: .LoginDestination)
                }
                Button("Sign Up") {
                    signUp()
                }
            }
        }.buttonStyle(.borderedProminent)
    }
    
    func signUp() {
        navi.navigate(to: .NewAccountDestination)
    }
    
}


#Preview {
    LoginView()
}
