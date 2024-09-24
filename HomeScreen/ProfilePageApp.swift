//
//  ProfilePageApp.swift
//  ProfilePage
//
//   Created by شهد علي on 21/03/1446 AH.
//

import SwiftUI
import SwiftData

struct MainContentView: View {
    @Binding var name: String
    @Binding var email: String
    @Binding var bio: String
    @Binding var education: String
    @Binding var skills: String

    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                     
                        .renderingMode(.template)
                    Text("Home")
                }
                
            
                .tag(0)
              

            ContentView(name: $name, email: $email, bio: $bio, education: $education, skills: $skills)
                .tabItem {
                    Image(systemName: "person.circle.fill")
                      
                    
                    Text("Profile")
                       
                        
                }
                .tag(1)
               
                          }
                      }
        }
                                 


@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            SignUpPage()
        }
    }
}
