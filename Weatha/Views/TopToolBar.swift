//
//  Toolbar.swift
//  Weatha
//
//  Created by Christopher Koski on 4/4/22.
//

import SwiftUI

struct TopToolBar: View {
  
  @ObservedObject var locationManager: LocationManager
  @ObservedObject var currentWeatherManager: CurrentWeatherManager
  @ObservedObject var forecastManager: ForecastManager
  
  @State var tapLocation = false
  @State var tapSearch = false
  
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
            .scaleEffect(tapLocation ? 1.2 : 1)
            .animation(.spring(response: 0.4, dampingFraction: 0.6))
            .onTapGesture {
              tapLocation = true
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                tapLocation = false
              }
            }
        }
        Spacer()
        Image(systemName: "magnifyingglass")
          .resizable()
          .frame(width: 28, height: 28)
          .foregroundColor(Color("TextColor"))
          .scaleEffect(tapSearch ? 1.2 : 1)
          .animation(.spring(response: 0.4, dampingFraction: 0.6))
          .onTapGesture {
            tapSearch = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
              tapSearch = false
            }
          }
          .padding()
      }
      Spacer()
    }
  }
  
  func getUserLocation() {
    locationManager.manager.requestWhenInUseAuthorization()
    print(locationManager.lastLocation ?? 0)
    currentWeatherManager.fetchCurrentWeather(lat: locationManager.lastLocation!.latitude, lon: locationManager.lastLocation!.longitude)
    forecastManager.fetchForecast(lat: locationManager.lastLocation!.latitude, lon: locationManager.lastLocation!.longitude)
  }
}

struct Toolbar_Previews: PreviewProvider {
  static var forecastManager = ForecastManager()
  static var currentWeatherManager = CurrentWeatherManager()
  static var locationManager = LocationManager()
  
  static var previews: some View {
    ZStack {
      BackgroundGradient()
      TopToolBar(locationManager: locationManager, currentWeatherManager: currentWeatherManager, forecastManager: forecastManager)
    }
  }
}
