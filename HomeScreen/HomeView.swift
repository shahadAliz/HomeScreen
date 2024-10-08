//
//  HomeView.swift
//  ProfilePage
//
//  Created by شهد علي on 21/03/1446 AH.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var weather: WeatherResponse?
    @State private var city: String = "Riyadh"
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Enter city", text: $city)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: fetchWeather) {
                    Text("Get Weather")
                        .padding()
                        .background(Color.purple)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
                if let weather = weather {
                    VStack {
                        Text("Temperature: \(weather.main.temp)°C")
                            .font(.largeTitle)
                        Text("Humidity: \(weather.main.humidity)%")
                        Text(weather.weather.first?.description.capitalized ?? "")
                            .font(.headline)
                        if let icon = weather.weather.first?.icon {
                        AsyncImage(url: URL(string: "https://openweathermap.org/img/w/\(icon).png")) { image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                    }
                    .padding()
                } else if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
            .navigationTitle("Weather")
            .navigationBarItems(leading: Button(action: {
                           presentationMode.wrappedValue.dismiss()
                       }) {
                           Text("Back")
                             
                       })
        
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: fetchWeather) {
                                    Text("Refresh")
                                }
                            }
                        }
            }
        .padding()
    }
    
    private func fetchWeather() {
        let networkManager = WeatherNetworkManager()
        networkManager.fetchWeather(for: city) { weather, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    self.weather = nil
                } else {
                    self.weather = weather
                    self.errorMessage = nil
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
