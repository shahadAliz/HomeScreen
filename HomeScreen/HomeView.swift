//
//  HomeView.swift
//  ProfilePage
//
//  Created by شهد علي on 21/03/1446 AH.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("HOME")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .lineLimit(32)
                        .bold()
                        .padding(.bottom, 30.0)
                        .padding(.top, 60.0)
                        .foregroundColor(.purple)
                    Image("SHAHAD")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(Color.purple)
                        .padding(.bottom, 25)
                    .padding()
                }
                .padding()
            }
        }
    }
    
   
}

#Preview {
    HomeView()
}
