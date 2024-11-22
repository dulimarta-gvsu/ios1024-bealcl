//
//  SignInView.swift
//  ios1024
//
//  Created by Clay Beal on 11/21/24.
//

import SwiftUI
import FirebaseAuth

struct SignInView: View {
    @EnvironmentObject var navi: MyNavigator
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginError: String = ""

    var body: some View {
        VStack {
            Text("Sign In")
                .font(.largeTitle)
                .padding()

            // Email TextField
            TextField("Email", text: $email)
                .padding()
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            // Password SecureField
            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            // Sign In Button
            Button("Sign In") {
                signIn()
            }
            .buttonStyle(.borderedProminent)
            .padding()

            // Error Message
            if !loginError.isEmpty {
                Text(loginError)
                    .foregroundColor(.red)
                    .padding()
            }

            Spacer()
        }
        .padding()
    }

    func signIn() {
        // Firebase Authentication
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // Display the error message if authentication fails
                loginError = "Error: \(error.localizedDescription)"
            } else {
                // On successful login, navigate to the game view
                navi.navigate(to: .GameDestination)
            }
        }
    }
}

#Preview {
    SignInView()
}