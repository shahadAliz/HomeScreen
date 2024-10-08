//
//  WeatherAPI.swift
//  HomeScreen
//
//  Created by شهد علي on 05/04/1446 AH.
//

import Foundation

class WeatherNetworkManager {
    
    let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    let apiKey = "6db4bda1834684b79ceae1379c4cc1d6"
    
    func fetchWeather(for city: String, completion: @escaping (WeatherResponse?, Error?) -> Void) {
        let urlString = "\(baseURL)?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "", code: 100, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "", code: 100, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                return
            }
            
            do {
                let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completion(weatherResponse, nil)
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
}
