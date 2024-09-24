//
//  SignUpPage.swift
//  ProfilePage
//
//    Created by شهد علي on 21/03/1446 AH.
//
import SwiftUI

struct SignUpPage: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var bio: String = ""
    @State private var education: String = ""
    @State private var skills: String = ""
    
    @State private var signUpCompleted: Bool = false

    var body: some View {
        if signUpCompleted {
            MainContentView(name: $name, email: $email, bio: $bio, education: $education, skills: $skills)
        } else {
            VStack {
                Text("Creat Account")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 30)
                    .foregroundColor(.purple)

                formSection(title: "Name", text: $name)
                formSection(title: "Email", text: $email, keyboardType: .emailAddress)
                formSection(title: "Bio", text: $bio)
                formSection(title: "Education", text: $education)
                formSection(title: "Skills", text: $skills)
                
                Button(action: {
                    signUpCompleted = true
                }) {
                    Text("Sign Up")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding(.horizontal, 16)
                .padding(.top, 20)
            }
            .padding()
        }
    }
    
    private func formSection(title: String, text: Binding<String>, keyboardType: UIKeyboardType = .default) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)
            TextField("Enter your \(title)...", text: text)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8)
                .keyboardType(keyboardType)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}

#Preview {
    SignUpPage()
}

