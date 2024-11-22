//
//  LoginView.swift
//  ios1024
//
//  Created by Clay Beal on 11/12/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var navi: MyNavigator
    @EnvironmentObject var vm: GameViewModel
    @State var loginError: String = ""
    
    var body: some View {
        VStack {
            Text("Login Here")
            if loginError.count > 0 {
                Text("Login feedback \(loginError)")
            }
            HStack {
                Button("Sign In") {
                    //TODO: Firebase
                    navi.navigate(to: .LoginDestination)
                }
                Button("Sign Up") {
                    //TODO: FIrebase
                    signUp()
                }
            }
        }.buttonStyle(.borderedProminent)
    }
    
    
    func checkAuthentication() {
        // Have to extract the user id and pwd from text field
        Task {
            if await vm.checkUserAcct(user: "RandomUser", pwd: "RandomPass") {
                navi.navigate(to: .GameDestination)
            } else {
                loginError = "Unable to log in"
            }
        }
        navi.navigate(to: .GameDestination)
    }
    
    func signUp() {
        navi.navigate(to: .NewAccountDestination)
    }
    
}


#Preview {
    LoginView()
}
