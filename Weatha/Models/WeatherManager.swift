//
//  WeatherManager.swift
//  Weatha
//
//  Created by Christopher Koski on 3/27/22.
//

import Foundation

class WeatherManager: ObservableObject {
  @Published var city: String?
  
  var apiKey = "2e22b2e5420de2d5f7a7d1a713555439"
  
  func fetchWeather() {
    guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=miami&units=imperial&appid=" + apiKey) else {
      print("Invalid URL")
      return
    }
    print(url)
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      
      do {
        let decodedData = try! JSONDecoder().decode(WeatherModel.self, from: data!)
        print(decodedData.name)
        self.city = decodedData.name
        print("ahoy")
        return
      } catch {
        print("Failed fetching data")
        return
      }
    }
      task.resume()
  }
}
