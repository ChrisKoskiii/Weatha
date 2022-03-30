//
//  ContentView.swift
//  Weatha
//
//  Created by Christopher Koski on 3/26/22.
//

import SwiftUI
import CoreLocation
import CoreLocationUI

struct TodayView: View {
  @StateObject var weatherManager = CurrentWeatherManager()
  @StateObject var locationManager = LocationManager()
  @StateObject var forecastManager = ForecastManager()
  var body: some View {
    ZStack {
      BackgroundGradient()
      TopToolBar(locationManager: locationManager, weatherManager: weatherManager, forecastManager: forecastManager)
      CenterWeatherView(locationManager: locationManager, weatherManager: weatherManager)
    }
  }
}


struct TopToolBar: View {
  
  @ObservedObject var locationManager: LocationManager
  @ObservedObject var weatherManager: CurrentWeatherManager
  @ObservedObject var forecastManager: ForecastManager
  var body: some View {
    
    VStack {
      HStack {
        Button {
          getUserLocation()
        } label : {
          Image(systemName: "location.circle")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(Color("TextColor"))
            .padding()
        }
        Spacer()
        Image(systemName: "magnifyingglass")
          .resizable()
          .frame(width: 28, height: 28)
          .foregroundColor(Color("TextColor"))
          .padding()
      }
      Spacer()
    }
  }
  
  func getUserLocation() {
    locationManager.manager.requestWhenInUseAuthorization()
    print(locationManager.lastLocation ?? 0)
    weatherManager.fetchCurrentWeather(lat: locationManager.lastLocation!.latitude, lon: locationManager.lastLocation!.longitude)
    forecastManager.fetchForecast(lat: locationManager.lastLocation!.latitude, lon: locationManager.lastLocation!.longitude)
  }
}

struct CenterWeatherView: View {
  @ObservedObject var locationManager: LocationManager
  @ObservedObject var weatherManager: CurrentWeatherManager
  
  var body: some View {
    VStack {
      Text(weatherManager.city)
        .kerning(1.0)
        .fontWeight(.bold)
        .foregroundColor(Color("TextColor"))
        .multilineTextAlignment(.center)
        .lineSpacing(4)
        .font(.title)
      Image(systemName: weatherManager.conditionString)
        .resizable()
        .foregroundColor(Color("TextColor"))
        .scaledToFill()
        .frame(width: 200, height: 200)
        .padding()
      Text("\(weatherManager.temp)°")
        .kerning(-1.0)
        .foregroundColor(Color("TextColor"))
        .fontWeight(.black)
        .font(.largeTitle)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var weatherManager = CurrentWeatherManager()
  
  static var previews: some View {
    TodayView(weatherManager: weatherManager)
  }
}
