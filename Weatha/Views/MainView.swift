//
//  MainView.swift
//  Weatha
//
//  Created by Christopher Koski on 3/26/22.
//

import SwiftUI

struct MainView: View {
  @StateObject var currentWeatherManager = CurrentWeatherManager()
  @StateObject var forecastManager = ForecastManager()
  @StateObject var locationManger = LocationManager()
  var body: some View {
    TabView {
      TodayView(weatherManager: currentWeatherManager, forecastManager: forecastManager)
        .tabItem {
          Label("Today", systemImage: "sun.max")
        }
      DailyView(forecastManager: forecastManager)
        .tabItem {
          Label("Daily", systemImage: "calendar")
        }
      SettingsView()
        .tabItem {
          Label("Settings", systemImage: "gear")
        }
    }
    .accentColor(Color("TextColor"))
  }
}

struct MainView_Previews: PreviewProvider {
  static var weatherManager = CurrentWeatherManager()
  
  static var previews: some View {
    MainView().preferredColorScheme(.dark)
  }
}
