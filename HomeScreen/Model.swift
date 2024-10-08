//
//  Model.swift
//  HomeScreen
//
//  Created by شهد علي on 05/04/1446 AH.
//

import Foundation

struct WeatherResponse: Codable {
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let humidity: Double
}

struct Weather: Codable {
    let description: String
    let icon: String
}
